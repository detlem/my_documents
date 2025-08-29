# loggerの設定方法

## 既存のアプリ（例：uvicorn）のログをファイルにも出力する例

logging.json
```json
{
  "version": 1,
  "disable_existing_loggers": false,
  "formatters": {
    "standard": {
      "format": "[%(asctime)s] [%(levelname)s] %(name)s: %(message)s"
    }
  },
  "handlers": {
    "file": {
      "class": "logging.FileHandler",
      "filename": "app.log",
      "formatter": "standard",
      "level": "DEBUG"
    }
  },
  "loggers": {
    "myapp": {
      "handlers": ["file"],
      "level": "DEBUG",
      "propagate": false
    },
    "uvicorn": {
      "handlers": ["file"],
      "level": "INFO",
      "propagate": false
    },
    "uvicorn.error": {
      "handlers": ["file"],
      "level": "INFO",
      "propagate": false
    },
    "uvicorn.access": {
      "handlers": ["file"],
      "level": "INFO",
      "propagate": false
    }
  },
  "root": {
    "handlers": ["file"],
    "level": "INFO"
  }
}
```

myapp.py
```
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
async def hello():
    return {'message': 'hello from myapp!'}
```

__main__.py
```
import json
import logging.config
import uvicorn
from pathlib import Path

def main():
    logconf = Path(__file__).with_name('logging.json')
    with logconf.open() as f:
        config = json.load(f)
    logging.config.dictConfig(config)

    # myapp.py の app を uvicorn に渡す
    uvicorn.run('yourapp.myapp:app', host='0.0.0.0', port=8000)

if __name__ == '__main__':
    main()
```

```
import os

# デフォルト値を設定
os.environ['MY_ENV'] = os.environ.get('MY_ENV', 'default_value')
os.environ['ANOTHER_ENV'] = os.environ.get('ANOTHER_ENV', 'default_value')

# apppppp.py の app を uvicorn で起動
import uvicorn
from apppppp import app

if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=8000)
```

```
export MY_ENV="custom_value"
python -m yourapp
```

```
# conftest.py など
import os
import pytest

@pytest.fixture(autouse=True)
def set_test_env(monkeypatch):
    monkeypatch.setenv('MY_ENV', 'test_value')
    monkeypatch.setenv('ANOTHER_ENV', 'something_else')
```
