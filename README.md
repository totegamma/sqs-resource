# Concourse SQS Resource

A Concourse resource for AWS SQS.

## source config
- `region_name`: *Required.* your SQS's region
- `access_key`: *Required.* aws access key id
- `secret_key`: *Required.* aws secret access key
- `queue_url`: *Required.* your SQS's URL

## Behaviour

### `check`:
receive\_message but no delete.

### `in`:
receive\_message and delete.

### `out`:
post\_message.

