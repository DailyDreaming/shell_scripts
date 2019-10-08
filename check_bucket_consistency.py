import boto3
from google.cloud import storage


def get_all_gcp_keys(bucket_iterator):
    for bucket in bucket_iterator:
        yield bucket.name


def get_all_aws_keys(bucket_iterator):
    for bucket in bucket_iterator:
        yield bucket.key


s3 = boto3.resource('s3')
my_bucket = s3.Bucket('org-hca-dss-staging')

gcs = storage.Client()
a_bucket = gcs.lookup_bucket('org-hca-dss-staging')

# listing on both buckets defaults to alphabetical order
# so in recently synced buckets, the lists should be nearly identical
diff_list = {'aws': [],
             'gcp': []}
gcp_iter = get_all_gcp_keys(a_bucket.list_blobs())
aws_iter = get_all_aws_keys(my_bucket.objects.all())
gcp_key = next(gcp_iter, '')
aws_key = next(aws_iter, '')
while True:
    if gcp_key > aws_key:
        diff_list['aws'].append(aws_key)
        print(f'Extra in AWS: {aws_key}')
        aws_key = next(aws_iter, '')
    elif gcp_key < aws_key:
        diff_list['gcp'].append(gcp_key)
        print(f'Extra in GCP: {gcp_key}')
        gcp_key = next(gcp_iter, '')
    elif gcp_key == aws_key:
        aws_key = next(aws_iter, '')
        gcp_key = next(gcp_iter, '')

    if aws_key == '':
        for g in gcp_iter:
            diff_list['gcp'].append(gcp_key)
            print(f'Extra in GCP: {g}')
        break
    elif gcp_key == '':
        for a in aws_iter:
            diff_list['aws'].append(aws_key)
            print(f'Extra in AWS: {a}')
        break

with open('gcp.log', 'w') as f:
    for g in gcp_key:
        f.write(f'{g}\n')

with open('aws.log', 'w') as f:
    for a in aws_key:
        f.write(f'{a}\n')
