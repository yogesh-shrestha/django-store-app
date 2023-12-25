from uuid import uuid4
from django.db import models
from django.utils.text import slugify
from django.core.validators import MinValueValidator
from django.conf import settings

from .customs import validate_image_size

class Customer(models.Model):
    MEMBERSHIP_NORMAL = 'N'
    MEMBERSHIP_PREMIUM = 'P'

    MEMBERSHIP_CHOICES = [
        (MEMBERSHIP_NORMAL, 'NORMAL'),
        (MEMBERSHIP_PREMIUM, 'PREMIUM')
    ]

    birth_date = models.DateField(null=True,
                                  blank=False)
    membership = models.CharField(max_length=1,
                                  choices=MEMBERSHIP_CHOICES,
                                  default=MEMBERSHIP_NORMAL)
    user = models.OneToOneField(settings.AUTH_USER_MODEL, 
                                on_delete=models.CASCADE)
    
    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'



class Category(models.Model):
    name = models.CharField(null=False,
                            blank=False,
                            max_length=255,
                            unique=True)
    def __str__(self):
        return self.name 
    
    

class Product(models.Model):
    title = models.CharField(null=False,
                             blank=False,
                             max_length=255,
                             unique=True)
    slug = models.SlugField(blank=True, 
                            max_length=300)
    description = models.TextField(null=True,
                                   blank=True,
                                   max_length=1024)
    category = models.ForeignKey(Category, 
                                 related_name='products', 
                                 default=1,
                                 on_delete=models.SET_DEFAULT)
    price = models.DecimalField(max_digits=6,
                                decimal_places=2,
                                validators=[MinValueValidator(1)])
    date_created = models.DateField(auto_now_add=True)
    last_updated = models.DateField(auto_now=True)
    inventory = models.IntegerField()

    def __str__(self) -> str:
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super(Product, self).save(*args, **kwargs)

    class Meta: ['-last_updated']



class ProductImage(models.Model):
    product = models.ForeignKey(Product, 
                                on_delete=models.CASCADE,
                                related_name='images')
    image = models.ImageField(upload_to='mybazaar/images',
                              validators=[validate_image_size])
    
    def __str__(self):
        return str(self.product)



class Order(models.Model):
    PAYMENT_STATUS_PENDING = 'P'
    PAYMENT_STATUS_COMPLETE = 'C'

    PAYMENT_STATUS_CHOICES = [(PAYMENT_STATUS_PENDING, 'Pending'),
                              (PAYMENT_STATUS_COMPLETE, 'Complete')]
    
    placed_on = models.DateTimeField(auto_now_add=True)
    payment_status = models.CharField(max_length=1,
                                    choices=PAYMENT_STATUS_CHOICES)
    customer = models.ForeignKey(Customer, 
                                related_name='orders',
                                on_delete=models.PROTECT)
    


class OrderItem(models.Model):
    order = models.ForeignKey(Order, 
                              related_name='orderitems',
                              on_delete=models.CASCADE)
    product = models.ForeignKey(Product,
                                on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField()

    


class Cart(models.Model):
    id = models.UUIDField(primary_key=True,
                          default=uuid4,
                          editable=False,
                          max_length=36)
    
    created_at = models.DateField(auto_now_add=True)


class CartItem(models.Model):
    cart = models.ForeignKey(Cart, 
                             on_delete=models.CASCADE,
                             related_name='items')
    product = models.ForeignKey(Product, 
                                on_delete=models.CASCADE)
    quantity = models.PositiveSmallIntegerField(validators= [MinValueValidator(1)])

    class Meta:
        unique_together = [['cart', 'product']]



class Review(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    description = models.TextField()
    date = models.DateField(auto_now_add=True)
    


