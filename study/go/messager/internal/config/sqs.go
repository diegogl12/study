package config

type SqsConfig struct {
	QueueName string `default:"my_queue" envconfig:"MESSAGER_QUEUE_NAME"`
	Timeout   int32  `default:100 envconfig:"MESSAGER_QUEUE_TIMEOUT"`
	Endpoint  string `default:"http://localhost:4566" envconfig:"MESSAGER_QUEUE_ENDPOINT"`
	Region    string `default:"us-east-1" envconfig:"MESSAGER_QUEUE_REGION"`
	KeyId     string `default:"localstack" envconfig:"MESSAGER_QUEUE_KEY_ID"`
	AccessKey string `default:"localstack" envconfig:"MESSAGER_QUEUE_ACCESS_KEY"`
	Token     string `default:"" envconfig:"MESSAGER_QUEUE_TOKEN"`
}
