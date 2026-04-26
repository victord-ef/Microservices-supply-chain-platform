from fastapi import APIRouter

router = APIRouter()

@router.get("/inventory")
def list_inventory():
    return {
        "inventory": [
            {"sku": "sku-1001", "name": "laptop", "stock": 12},
            {"sku": "sku-1002", "name": "keyboard", "stock": 34},
        ]
    }
