from typing import Union

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def debdeep(self):
    return {"msg" : "This is first cloud run project"}