package main

import (
	"context"
	"fmt"
	"log"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/sqs"
	"github.com/aws/aws-sdk-go-v2/service/sqs/types"
)

const sqs_region = "us-central-1"

func main() {
	queue := "my_queue"

	localstackEndpoint := "http://localhost:4566"
	cfg := aws.Config{
		Region:      sqs_region,
		Credentials: credentials.NewStaticCredentialsProvider("localstack", "localstack", ""),
		EndpointResolver: aws.EndpointResolverFunc(func(service, region string) (aws.Endpoint, error) {
			if service == sqs.ServiceID && region == sqs_region {
				return aws.Endpoint{
					URL: localstackEndpoint,
				}, nil
			}
			return aws.Endpoint{}, fmt.Errorf("unknown endpoint for service %s and region %s", service, region)
		}),
	}

	svc := sqs.NewFromConfig(cfg)

	urlResult, err := svc.GetQueueUrl(context.TODO(), &sqs.GetQueueUrlInput{
		QueueName: &queue,
	})

	if err != nil {
		log.Fatalf("unable to get queue URL, %v", err)
	}

	fmt.Println(*urlResult.QueueUrl)

	printMessage(svc, urlResult.QueueUrl)
}

func printMessage(svc *sqs.Client, queueURL *string) {
	// Define a timeout value as int32
	timeout := int32(30) // Example timeout value in seconds

	// Call ReceiveMessage with context
	msgResult, err := svc.ReceiveMessage(context.TODO(), &sqs.ReceiveMessageInput{
		AttributeNames: []types.QueueAttributeName{
			types.QueueAttributeNameAll,
		},
		MessageAttributeNames: []string{
			"All", // Use "All" to retrieve all message attributes
		},
		QueueUrl:            queueURL,
		MaxNumberOfMessages: int32(1), // Max number of messages to receive
		VisibilityTimeout:   timeout,
	})
	if err != nil {
		log.Fatalf("Error on fetching message: %v", err)
	}

	for _, message := range msgResult.Messages {
		fmt.Println(message)
		fmt.Println(*message.Body)
	}

}
