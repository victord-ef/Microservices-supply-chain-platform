from fastapi import FastAPI
from .routes import router

app = FastAPI(title="orders-service", version="0.1.0")

app.include_router(router)

@app.get("/health")
def health():
    return {"status": "ok", "service": "orders-service"}
