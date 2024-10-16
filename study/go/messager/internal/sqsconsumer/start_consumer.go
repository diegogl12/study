package sqsconsumer

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/aws/aws-sdk-go-v2/service/sqs"
	"github.com/aws/aws-sdk-go-v2/service/sqs/types"
)

// const name = "my_queue"
const timeout_duration = 10

func Start(server *sqs.Client) {
	log.Println("Starting consumer...")

	cfg := sqs_config()
	queue_url := getUrl(server, cfg.QueueName)

	// INIT THE CONSUMER
	for {
		batch, err := server.ReceiveMessage(context.TODO(), &sqs.ReceiveMessageInput{
			AttributeNames: []types.QueueAttributeName{
				types.QueueAttributeNameAll,
			},
			MessageAttributeNames: []string{
				"All", // Use "All" to retrieve all message attributes
			},
			QueueUrl:            queue_url,
			MaxNumberOfMessages: int32(3), // Max number of messages to receive
			VisibilityTimeout:   cfg.Timeout,
		})

		if err != nil {
			log.Fatalf("Error on fetching message: %v", err)
		}

		for _, message := range batch.Messages {
			messageHandler(message)
			deleteMessage(server, queue_url, message)
		}

		// WAITS 1 SECOND BEFORE CONSUME NEXT BATCH
		time.Sleep(1 * time.Second)
	}

}

func messageHandler(message types.Message) {
	fmt.Println("Message:", *message.Body)
}

func deleteMessage(server *sqs.Client, queue_url *string, message types.Message) {
	_, err := server.DeleteMessage(context.TODO(),
		&sqs.DeleteMessageInput{
			QueueUrl:      queue_url,
			ReceiptHandle: message.ReceiptHandle,
		})

	if err != nil {
		log.Fatalf("Error deleting message: %v", err)
	}
}

func getUrl(server *sqs.Client, queue_name string) *string {

	//	list, _ := server.ListQueues(context.TODO(), &sqs.ListQueuesInput{})
	//	fmt.Println(list)
	url_result, err := server.GetQueueUrl(context.TODO(), &sqs.GetQueueUrlInput{
		QueueName: &queue_name,
	})

	if err != nil {
		log.Fatalf("unable to get queue URL, %v", err)
	}

	return url_result.QueueUrl
}
