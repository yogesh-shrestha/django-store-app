from django.core.mail import send_mail


def send():
    send_mail('subject', 'message', 'info@bloggerdemo.com', ['aa@bb.com'])

EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = "localhost"
EMAIL_HOST_USER = ""
EMAIL_HOST_PASSWORD = ""
EMAIL_PORT = 2525
DEFAULT_FROM_EMAIL = 'admin@demoecommerce.com'
send()