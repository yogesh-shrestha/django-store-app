from django.contrib import admin
from django.urls import path
from . import views


urlpatterns = [
    # category and prduct
    path('categories/', views.CategoryListView.as_view(),
        name='category-list'),
    path('products/', views.ProductListView.as_view(),
        name='product-list'),
    path('products/<int:pk>/', views.ProductDetailView.as_view(),
        name='product-detail'),
    path('categories/<int:pk>/products/', views.CategoryProductListView.as_view(),
        name='category-product-list'),

    # cart and cartitems
    path('carts/', views.CartCreateView.as_view(),  
        name='cart-create'),
    path('carts/<uuid:pk>/', views.CartRetrieveDeleteView.as_view(),  
        name='cart-detail'),
    path('carts/<uuid:pk>/items/', views.CartitemsListCreateView.as_view(),  
        name='cart-items-list-create'),
    path('carts/<uuid>/items/<int:pk>/', views.CartitemRetrieveUpdateDeleteView.as_view(),  
        name='cart-items-retrieve-update-delete'),

    # order and orderitems
    path('orders/<int:pk>/', views.OrderRetrieveView.as_view(),  
          name='order-retrieve-update'),
    path('orders/', views.OrderListView.as_view(),  
          name='order-list'),
    path('customers/', views.CustomerListView.as_view(),  
          name='customer-list'),
    path('customers/me/', views.CustomerMeView.as_view(),  
          name='customer-me'),

]

