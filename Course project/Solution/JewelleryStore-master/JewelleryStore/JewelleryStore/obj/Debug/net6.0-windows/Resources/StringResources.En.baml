   M S B A M L   `   `   `  ����O  Kmscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e0891&clr-namespace:System;assembly=mscorlibSystem  5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089   Show All  	Necklaces 	 Rings  Earrings  	Wristwear 	 Login  Username  Password  RepeatPassword 	 PasswordMismatch 
 Next  Fav  Language 	 Total  Back  NumberOfProducts 
 Finish  Register  RegisterComplete  ErrorMessage  ErrorMessageEmpty  ErrorEmptyFav  	ErrorName  ErrorLastName  
ErrorLogin  ErrorLoginExists  ErrorPassword  ErrorSameImage  PasswordRules  
ErrorEmail  ErrorEmailInUse  ErrorDateBirth   ErrorProductName ! ErrorProductPrice " ErrorProductQuantity # ErrorProductWeight $ ErrorProductImage % QuantityOver & ErrorStoneInsert ' 
ErrorMetal ( ErrorProductType ) ProductNameRus * ProductNameEn + ProductDescriptionRus , ProductDescriptionEn - ErrorProductDescription . ErrorMetalSample / ProductDescription 
0 Active 1 ShowActiveOnly 2 ErrorEmptyCart 3 ProductAlreadyInactive 4 Success 
5 Search 6 Add 7 Edit 8 EditAccount 
9 Delete : Products 	; Users < 
Statistics = User > 	DateBirth 
? E-mail @ Lastname A Type 	B Price 
C Weight 	D Metal E MetalSample 
F Insert G Quantity H ProductName I AddImage 
J SortBy 
K NoSort L 	Ascending M 
Descending N 	ItemsSold 
O Profit 	P Bills 
Q Themes R Blue S Red 	T Brown U 
YourOrders V OrderNumber W DateOfOrder X YourProducts 
Y Cancel Z 	EnterCode [ Code \ ErrorVerificationCode ] ErrorSendEmail ^ 
ForgotPass _ EmailRecovery ` Recovery a UserDoesNotExist b ChangeEmail c NothingFound 	d Stock e ChangePromotion f SaveChanges g WOW 
h AccMan i AccUser j DiscountInPercent k SpecialOffers l TypesOfDishes m ApplyCoupon n MakeDiscount o SelectImage p UpdateDiscount q PromotionsAndOffers r DeletePromo s DiscountsOnDishes t DiscountOnBurger u DiscountOnShawerma v DiscountOnSalads w DiscountOnDrinks x Discount y Presence z Absence { DeleteStockBtn 
| UserID } Nickname ~ Activity 
 Access 
� Action � 	OrderList � DeleteAccount � BlockAccount � Delivery 
� Pickup � City 
� Street 	� House � 	Apartment � Entrance 	� Floor � Comment � 	CityError � StreetError � 
FloorError � DeliveryForm 
� BillID � OrderedDishes � 	OrderCost � ClientNickname � ClientFirstName � ClientLastName � ClientEmail � DeliveryType � 
ClientCity � ClientStreet � ClientHouse � ClientApartment � ClientEntrance � ClientFloor � ClientComment � OrderStatus � DeletePromotion � ChangeStatus � SendMessageToTheClient � ChangeOrderStatus � SelectStatus � Pending � 	Confirmed � Sent � 	Delivered � GettingReady 	� Ready � ChooseStatusError � SendingMessageToTheClient � ChooseAdressError � ChooseAdress � Adress_1 � Adress_2 � CommentOnTheOrder�� 5      F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     :x,http://schemas.microsoft.com/winfx/2006/xaml     5      1system&clr-namespace:System;assembly=mscorlib  5      %^"  &	        &	       &	 ?     &	 _     &	 }     &	 �     &	 �     &	 �     &	 �     &		     &	
 H    &	 d    &	 �    &	 �    &	 �    &	 �    &	     &	 "    &	 H    &	 h    &	 �    &	 �    &	 �    &	     &	 D    &	 m    &	 �    &	 �    &	 	    &	 �    &	 �    &	 �    &	      &	! B    &	" k    &	# �    &	$ �    &	% �    &	& +    &	' `    &	( �    &	) �    &	* �    &	+     &	, M    &	- �    &	. �    &	/ �    &	0     &	1 !    &	2 I    &	3 o    &	4 �    &	5 �    &	6 �    &	7 �    &	8 	    &	9 ;	    &	: ]	    &	; }	    &	< �	    &	= �	    &	> �	    &	? 
    &	��
    &	@ ;
    &	A \
    &	B �
    &	C �
    &	D �
    &	E �
    &	F     &	G 3    &	H S    &	I w    &	J �    &	K �    &	L �    &	M �    &	N     &	O B    &	P `    &	Q }    &	R �    &	S �    &	T �    &	U �    &	V     &	W 3    &	X X    &	Y x    &	Z �    &	[ �    &	\     &	] 6    &	^ �    &	_ �    &	`     &	a -    &	b Y    &	c �    &	d �    &	e �    &	f     &	g 2    &	h T    &	i �    &	j �    &	k �    &	l     &	m Y    &	n }    &	o �    &	p �    &	q �    &	r !    &	s N    &	t y    &	u �    &	v �    &	w �    &	x $    &	y D    &	z c    &	{ �    &	| �    &	} �    &	~ �    &	 �    &	�     &	� 9    &	� [    &	� �    &	� �    &	� �    &	� �    &	�      &	�     &	� ;    &	� \    &	� |    &	� �    &	� �    &	� �    &	�      &	� 1    &	� Q    &	� u    &	� �    &	� �    &	� �    &	� 	    &	� /    &	� Q    &	� v    &	� �    &	� �    &	� �    &	� �    &	�     &	� +    &	� J    &	� n    &	� �    &	� �    &	� �    &	�     &	� ?    &	� ^    &	�     &	� �    &	� �    &	� �    &	� �    &	� 3    &	� s    &	� �    &	� �    &	� �    &	� )    ��5      Show All��6/   ��5      Burgers��6/   ��5      Shawarma��6,   ��5      
Salads��6-   ��5	      
Drinks��6.   ��5
      	Login��6)   ��5      Username��6/   ��5      Password��6/   ��5      Repeat password��6<   ��5      Password mismatch��6@   ��5      Cart��6'   ��5      	Favorites��6+   ��5      Language��6/   ��5      	Total��6)   ��5      Back��6'   ��5      Goods in stock��6=   ��5      
FINISH��6+   ��5      Create account��65   ��5      Register��67   ��5      Wrong login or password��6B   ��5      Backet is empty!��6@   ��5      Favorites list is empty!��6D   ��5      Enter your name!��68   ��5      Enter your last name!��6A   ��5      Enter your login!��6:   ��5      .*User with the same username already exists��6Y   ��5      Wrong password format��6A   ��5       Image already in use!��6B   ��5!      gcPassword must contain at list one letter and one number. Password length is from 8 to 15 characters��6�   ��5"      Wrong e-mail address!��6>   ��5#      )%This e-mail address is already in use��6S   ��5$      Wrong date of birth!��6A   ��5%      Wrong dish name!��6?   ��5&      Wrong dish price!��6A   ��5'      Wrong dish quantity!��6G   ��5(      Wrong dish weight!��6C   ��5)      #File is corrupted or not found!��6O   ��5*      Please select fewer dishes!��6F   ��5+      !Please indicate cooking time!��6L   ��5,      Specify the size��69   ��5-       Specify the type of product!��6K   ��5.      Product Name (russian)��6C   ��5/      Product Name (english)��6B   ��50      !Product Description (russian)��6Q   ��51      !Product Description (english)��6P   ��52       Description length exceeded!��6R   ��53      Wrong size sample!��6A   ��54      Description��6<   ��55      
Active��6+   ��56      Show active only��6=   ��57      Cart is empty!��6;   ��58      Product is no longer active��6P   ��59      Success!��6.   ��5:      
Search��6+   ��5;      ADD��6%   ��5<      EDIT��6'   ��5=      Edit account��66   ��5>      
DEACTIVATE��6/   ��5?      Products��6/   ��5@      	Users��6)   ��5A      
Statistics��63   ��5B      Employee��6+   ��5C      Date of Birth��65   ��5D      
E-mail��6+   ��5E      Name��6'   ��5F      	Last Name��60   ��5G      Product type��6/   ��5H      Price without discount��6:   ��5I      
Weight (g)��6/   ��5J      Size��6(   ��5K      Size sample��65   ��5L      Cooking time��61   ��5M      Quantity��6/   ��5N      Product Name��66   ��5O      	Add Image��60   ��5P      Sort by��6,   ��5Q      None��6)   ��5R      	Ascending��61   ��5S      
Descending��63   ��5T      NUMBER OF SOLD ITEMS��6<   ��5U      
PROFIT��6+   ��5V      	BILLS��6)   ��5W      
Themes��6+   ��5X      TEAL��6'   ��5Y      RED��6%   ��5Z      	BROWN��6)   ��5[      Your orders��64   ��5\      	Order №��61   ��5]      Date of order��67   ��5^      Products��63   ��5_      
Cancel��6+   ��5`      3/A verification code has been sent to your email��6W   ��5a      Verification code��64   ��5b      Wrong verification code!��6L   ��5c      95An error has occurred! Check your internet connection��6b   ��5d      Forgot the password?��6=   ��5e      A=Enter the email address with which the account was registered��6i   ��5f      Password recovery��68   ��5g      User does not exist!��6C   ��5h      Сhange of email address��6A   ��5i      Nothing is found��6;   ��5j      Add a promotion��63   ��5k      "Put a picture of the promotion��6L   ��5l      Save changes��66   ��5m      
Wow! Cool!��6,   ��5n      Managing admin accounts��6<   ��5o      Customer account management��6A   ��5p      Percent discount��6@   ��5q      !PROMOTIONS AND SPECIAL OFFERS��6I   ��5r      2.Types of dishes for which there is a discount:��6Z   ��5s      Apply coupon��66   ��5t      Make a discount��6:   ��5u      Select new image��6:   ��5v      Update discounts��6=   ��5w      Promotions and offers��6O   ��5x      Removal of promotions��6?   ��5y      Discounts on dishes��6C   ��5z      Discount on burgers��6B   ��5{      Discount on shawarma��6E   ��5|      Discount on salads��6A   ��5}      Discount on drinks��6A   ��5~      Discount��6/   ��5      Present��6.   ��5�      
Absent��6,   ��5�      
Delete��63   ��5�      
UserID��6+   ��5�      Nickname��6/   ��5�      Activity��6/   ��5�      
Access��6+   ��5�      
Action��6+   ��5�      
Order list��62   ��5�      Delete account��6:   ��5�      Block account��68   ��5�      Delivery��6/   ��5�      
Pickup��6+   ��5�      City��6'   ��5�      
Street��6+   ��5�      	House��6)   ��5�      	Apartment��61   ��5�      Entrance��6/   ��5�      	Floor��6)   ��5�      Comment��6-   ��5�      Enter city!��63   ��5�      Enter street!��67   ��5�      Enter a positive integer!��6B   ��5�      Delivery��63   ��5�      Check number��61   ��5�      Ordered dishes��6:   ��5�      
Order cost��62   ��5�      User nickname��6:   ��5�      User First Name��6=   ��5�      User Last Name��6;   ��5�      
User email��64   ��5�      Delivery type��68   ��5�      City��6-   ��5�      
Street��61   ��5�      	House��6/   ��5�      	Apartment��67   ��5�      Entrance��65   ��5�      	Floor��6/   ��5�      Comment��63   ��5�      Order status��66   ��5�      Delete promotion��6>   ��5�      Change status��68   ��5�       Send a message to the client��6Q   ��5�      Change order status��6C   ��5�      Select status��68   ��5�      Pending��6-   ��5�      	Confirmed��61   ��5�      Sent��6'   ��5�      	Delivered��61   ��5�      Cooking��62   ��5�      
Cooked��6*   ��5�      &"You must select your order status!��6R   ��5�      ,(Sending a message to the client by email��6`   ��5�      You must select an address!��6K   ��5�      Select address��69   ��5�      Mogilevskaya street, 12A��6?   ��5�      Leninskaya street, 14��6<   ��5�      Comment on the order:��6E   5�      