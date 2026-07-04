import urllib.request
import json
import ssl

ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url = "https://tiendaonline4.pizzagest.info/PAV_JWT/authenticateEmployee"
payload = {
    "User": "34003655",
    "Pass": "3655",
    "ClientCode": "10"
}
data = json.dumps(payload).encode('utf-8')

# Prueba: Cabeceras exactas de RestTemplate
headers = {
    'Content-Type': 'application/json;charset=utf-8;',
    'Accept': 'text/plain, application/json, application/*+json, */*',
    'User-Agent': 'Java/18.0.2',
    'Connection': 'keep-alive'
}

req = urllib.request.Request(
    url,
    data=data,
    headers=headers,
    method='POST'
)

print("--- PROBANDO CON CABECERAS DE JAVA ---")
try:
    with urllib.request.urlopen(req, context=ctx, timeout=10) as r:
        print("SUCCESS (Status:", r.status, ")")
        print(r.read().decode('utf-8')[:200])
except Exception as e:
    print("FAILED -", e)
    if hasattr(e, 'read'):
        print(e.read().decode('utf-8')[:500])
