from django.contrib import admin
from django.urls import reverse
from django.db.models import Count
from django.utils.html import format_html, urlencode
from django.utils.translation import ngettext
from .models import Category, Product, ProductImage, Customer, Order, OrderItem



@admin.register(Customer)
class CustomerAdmin(admin.ModelAdmin):
    list_display = ['__str__', 'membership', 'orders']
    list_select_related = ['user']
    ordering = ['user__first_name', 'user__last_name']
    list_per_page = 20
    search_fields = ['first_name__istartswith', 'last_name__istartswith']
    list_filter = ['membership']
    actions = ['make_premium']

    @admin.action(description="Change to premium membership")
    def make_premium(self, request, qeuryset):
        updated = qeuryset.update(membership='P')
        self.message_user(
            request,
            ngettext(
                "%d customer was successfully upgraded to premium membership.",
                "%d customers were successfully upgraded to premium membership.",
                updated,
            ) 
            %updated)
        
    @admin.display(ordering='orders_count')
    def orders(self, customer):
        url = (
            reverse('admin:store_order_changelist')
            + '?'
            + urlencode({
                'customer__id': str(customer.id)
            })
            )   
        return format_html('<a href="{}">{}</a>', url, customer.orders_count)
    
    @admin.display(ordering='orders')
    def get_queryset(self, request):
        return super().get_queryset(request) \
                    .annotate(orders_count=Count('orders'))



@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ['name', 'products_count']

    @admin.display(ordering='products_count')
    def products_count(self, category):
        url = (
            reverse('admin:store_product_changelist')
            + '?'
            + urlencode({
                'category__id': str(category.id)
            })
        )
        return format_html('<a href="{}">{}</a>', url, category.products_count)
    
    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            products_count=Count('products')
        )
    
class InventoryFilter(admin.SimpleListFilter):
    title = 'inventory'
    parameter_name = 'inventory'

    def lookups(self, request, model_admin):
        return [
            ('<10', 'Low')
        ]
    
    def queryset(self, request, queryset):
        if self.value() == '<10':
            return queryset.filter(inventory__lt=10)   
        

class ProductImageInline(admin.TabularInline):
    model = ProductImage
    readonly_fields = ['thumbnail']
    extra = 0

    def thumbnail(self, instance):
        if instance.image.name != '':
            return format_html(f'<img src="{instance.image.url}" class="thumbnail"/>')
        return ''


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'price', 'inventory_status']
    list_select_related = ['category']
    fields = ['title', 'description', 'category', 'price', 'inventory']
    actions = ['clear_inventory']
    search_fields = ['title']
    list_filter = ['category', 'last_updated', InventoryFilter]
    inlines = [ProductImageInline]

    @admin.display(ordering='inventory')
    def inventory_status(self, product):
        if product.inventory < 10:
            return 'LOW'
        return 'HIGH'
    
    @admin.action(description='Clear Inventory')
    def clear_inventory(self, request, queryset):
        updated = queryset.update(inventory=0)
        self.message_user(
            request,
            f'{updated} product inventory cleared')

    class Media:
        css = {
            'all': ['store/style.css']
        }


class OrderItemInline(admin.TabularInline):
    autocomplete_fields = ['product']
    model = OrderItem
    extra = 0


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ['placed_on', 'customer', 'payment_status', 'order_items_count']
    list_select_related = ['customer']
    inlines = [OrderItemInline]

    def order_items_count(self, order):
        url = (
            reverse('admin:store_orderitem_changelist')
            + '?'
            + urlencode({
                'order__id': str(order.id)
            })
            )
        return format_html('<a href="{}">{}</a>', url, order.order_items_count)
    
    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            order_items_count=Count('orderitems'))


@admin.register(OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    list_display = ['order_id', 'product', 'quantity', ]
    list_select_related = ['order', 'product']

    def order_id(self, order_item):
        return order_item.order.id

    
