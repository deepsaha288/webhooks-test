import boto3
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--s3BucketName', required=True)
parser.add_argument('--stackName', required=True)  # You can use this for tagging or naming conventions
parser.add_argument('--AWSRegion', required=True)
parser.add_argument('--KMSEncryptionKeyARN', required=True)

args = parser.parse_args()

s3 = boto3.client('s3', region_name=args.AWSRegion)
kms_arn = args.KMSEncryptionKeyARN

# Create S3 bucket (region specific logic)
bucket_config = {'LocationConstraint': args.AWSRegion}
if args.AWSRegion == 'us-east-1':
    response = s3.create_bucket(Bucket=args.s3BucketName)
else:
    response = s3.create_bucket(Bucket=args.s3BucketName, CreateBucketConfiguration=bucket_config)

# Enable default encryption
s3.put_bucket_encryption(
    Bucket=args.s3BucketName,
    ServerSideEncryptionConfiguration={
        'Rules': [{
            'ApplyServerSideEncryptionByDefault': {
                'SSEAlgorithm': 'aws:kms',
                'KMSMasterKeyID': kms_arn
            }
        }]
    }
)

print(f"S3 bucket '{args.s3BucketName}' created with KMS encryption.")