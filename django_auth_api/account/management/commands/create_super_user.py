from account.models import User
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    help = 'Creates a superuser.'

    def handle(self, *args, **options):
        if not User.objects.filter(email='admin3@admin.com').exists():
            User.objects.create_superuser(
                email='admin3@admin.com',
                name='admin3',
                password='admin'
            )
        print('Superuser has been created.')
