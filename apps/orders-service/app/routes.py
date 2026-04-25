from fastapi import APIRouter

router = APIRouter()

@router.get("/orders")
def list_orders():
    return {
        "orders": [
            {"id": "ord-1001", "item": "laptop", "status": "created"},
            {"id": "ord-1002", "item": "keyboard", "status": "processing"},
        ]
    }


