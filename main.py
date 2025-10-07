from fastapi import FastAPI
from pydantic import BaseModel, Field
from typing import Optional

app = FastAPI()

# Define a Pydantic model for a user
class User(BaseModel):
    id: int
    name: str = Field(..., min_length=2, max_length=50)
    email: str
    is_active: Optional[bool] = True

# In-memory "database"
fake_users_db = {}

@app.post("/users/", response_model=User)
def create_user(user: User):
    fake_users_db[user.id] = user
    return user

@app.get("/users/{user_id}", response_model=User)
def get_user(user_id: int):
    user = fake_users_db.get(user_id)
    if not user:
        return {"error": "User not found"}
    return user


# @app.get("/")
# def debdeep():
#     return {"msg" : "This is first cloud run project"}