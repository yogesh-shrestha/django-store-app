from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated, IsAdminUser
from rest_framework.views import APIView
from .serializers import (CategorySerializer,
                          ProductSerializer,
                          CartSerializer,
                          CartItemSerializer,
                          AddCartItemSerializer,
                          UpdateCartItemSerializer,
                          RetrieveDeleteCartItemSerializer,
                          OrderSerializer,
                          CustomerSerializer,
                          CreateOrderSerializer,
                          OrderRetrieveSerializer,
                          )
from rest_framework.generics import (ListCreateAPIView, 
                                     ListCreateAPIView,
                                     RetrieveUpdateAPIView,
                                     ListAPIView,
                                     RetrieveAPIView,
                                     CreateAPIView,
                                     RetrieveDestroyAPIView,
                                     RetrieveUpdateDestroyAPIView,
                                     )

from .models import Category, Product, Cart, CartItem, Order, Customer


#================= Category / posts ==============================
class CategoryListView(ListAPIView):
    serializer_class = CategorySerializer
    queryset = Category.objects.all()
 

class ProductListView(ListAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()


class ProductDetailView(RetrieveAPIView):
    serializer_class = ProductSerializer
    queryset = Product.objects.all()

    

class CategoryProductListView(ListAPIView):
    serializer_class = ProductSerializer  

    def get_queryset(self):
        return Product.objects.filter(category=self.kwargs['pk'])


#=============== Cart / CartItem ===================================
class CartCreateView(CreateAPIView):
    serializer_class = CartSerializer
    queryset = Cart.objects.all()

    def get_serializer_context(self):
        return {'user_id': self.request.user}

    

class CartRetrieveDeleteView(RetrieveDestroyAPIView):
    serializer_class = CartSerializer

    def get_queryset(self):
        return Cart.objects.prefetch_related('items__product').filter(id=self.kwargs['pk'])
    
    
class CartitemsListCreateView(ListCreateAPIView):

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return AddCartItemSerializer
        return CartItemSerializer
    
    def get_serializer_context(self):
        return {'cart_id': self.kwargs['pk']}

    def get_queryset(self):
        return CartItem.objects.select_related('product').filter(cart=self.kwargs['pk'])
    
    
class CartitemRetrieveUpdateDeleteView(RetrieveUpdateDestroyAPIView):
    queryset = CartItem.objects.all()

    def get_serializer_class(self):
        if self.request.method == 'PATCH':
            return UpdateCartItemSerializer
        return RetrieveDeleteCartItemSerializer

    
#========== Order ===============================================

class OrderListView(ListCreateAPIView):
    permission_classes = [IsAuthenticated]

    def create(self, request, *args, **kwargs):
        serializer = CreateOrderSerializer(
            data=request.data,
            context={'user_id': self.request.user.id}
        )
        serializer.is_valid(raise_exception=True)
        order = serializer.save()
        print(order)
        serializer = OrderSerializer(order)
        return Response(serializer.data)
    
    def get_serializer_class(self):
        if self.request.method == 'POST':
            return CreateOrderSerializer
        return OrderSerializer

    def get_queryset(self):
        user = self.request.user
        if user.is_staff:
            return Order.objects.all()
        elif Customer.objects.filter(user_id=user.id).exists():
            customer = Customer.objects.get(user_id=user.id)
            return Order.objects.filter(customer_id=customer.id)


class OrderRetrieveView(RetrieveUpdateAPIView):
    serializer_class = OrderRetrieveSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        user = self.request.user
        if user.is_staff:
            return Order.objects.all()
        elif Customer.objects.filter(user_id=user.id).exists():
            customer = Customer.objects.get(user_id=user.id)
            return Order.objects.filter(customer_id=customer.id)
  

#============================= Customer =============================

class CustomerListView(ListAPIView):
    serializer_class = CustomerSerializer
    queryset = Customer.objects.all()
    permission_classes = [IsAdminUser]
     

class CustomerMeView(APIView):
    def get(self, request):
        user = self.request.user
        if not user.is_anonymous:
            customer = get_object_or_404(Customer, user_id=user.id)
            profile_data = {
                'id': customer.id,
                'first_name': user.first_name,
                'last_name': user.last_name,
                'membership': customer.membership,
                'birth_date': customer.birth_date
            }
            return Response(profile_data)
        return Response({'msg': 'You must be logged to have access to this page!'}, 
                        status=status.HTTP_404_NOT_FOUND)
    

    



