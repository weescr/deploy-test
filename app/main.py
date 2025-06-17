from httpx import get

def main():
    response = get("https://httpbin.org/get")
    print("Status:", response.status_code)
    print("Body:", response.json())

if __name__ == "__main__":
    main()

##### test
