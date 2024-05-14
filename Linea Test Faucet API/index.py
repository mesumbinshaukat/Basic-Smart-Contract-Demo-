import requests
import json

api_key = '61a592ed6f33484f899eb6e8cba6cded'

url = 'https://linea-mainnet.infura.io/v3/' + api_key

payload = {
    "jsonrpc": "2.0",
    "method": "eth_blockNumber",
    "params": [],
    "id": 1
}

headers = {'content-type': 'application/json'}

response = requests.post(url, data=json.dumps(payload), headers=headers).json()

print(response)