import pytest
from core.models import User


@pytest.fixture
def create_user():
    User.objects.create(username='u',
                        first_name='f',
                        last_name='l',
                        email='a@b.com',
                        password='p')


@pytest.mark.django_db
class TestUser:
    def test_str_user(self, create_user):
        user = User.objects.get(id=1)
        assert user.first_name == 'f'
        assert str(user) == 'f ' + 'l'
        assert user.is_staff == False
        assert user.is_superuser == False
        