from app import create_app, db
from config import Config

from app.models import User

app = create_app(config_class=Config)

with app.app_context():

    u = User(user_name="Test", email="test@user.com")
    db.session.add(u)
    u.set_password("123")
    db.session.commit()
