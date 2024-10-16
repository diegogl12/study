package sqsconsumer

import (
	"fmt"
	"log"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/credentials"
	"github.com/aws/aws-sdk-go-v2/service/sqs"
	"github.com/diegogl12/messager/internal/config"
	"github.com/kelseyhightower/envconfig"
)

const (
	sqs_region   = "us-east-1"
	sqs_endpoint = "http://localhost:4566"
)

func SetupService() *sqs.Client {
	log.Println("Seting up the SQS consumer...")
	config := buildAwsConfig()
	service := sqs.NewFromConfig(config)

	return service
}

func buildAwsConfig() aws.Config {
	cfg := sqs_config()

	config := aws.Config{
		Region:      cfg.Region,
		Credentials: credentials.NewStaticCredentialsProvider(cfg.KeyId, cfg.AccessKey, cfg.Token),
		EndpointResolver: aws.EndpointResolverFunc(func(service, region string) (aws.Endpoint, error) {
			if service == sqs.ServiceID && region == cfg.Region {
				return aws.Endpoint{
					URL: cfg.Endpoint,
				}, nil
			}
			return aws.Endpoint{}, fmt.Errorf("unknown endpoint for service %s and region %s", service, region)
		}),
	}

	return config
}

func sqs_config() config.SqsConfig {
	var cfg config.SqsConfig
	err := envconfig.Process("", &cfg)

	if err != nil {
		log.Fatalf("Error processing env config: %v", err)
	}

	return cfg
}
