   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:JewelleryStore.MessageWindowsJewelleryStore.MessageWindows  5   	   3    -JewelleryStore.MessageWindows.SendMessageForm   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:JewelleryStore.MessageWindows     5   	     � Title$  SendMessageForm��5   	   $	��552��6!   $	��600��5	   	    � 
ResizeMode$ NoResize=�5
   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � WindowStartupLocation$ CenterScreen=�5   	    � Cursor 5   	   �� *Cursor+.��5      � $��	0,0,0,-60q�6   .+�5   
   ��  �� CornerRadius$ 10��6   
�������   PrimaryHueLightBrush#���   5   	   $��2q�5   	   $��0,0,0,44q�6   �� 5   
   -   5         ! MaterialDesignFlatLightButton#��[ 5   	   $��538,11,10,569q�5   	   $
��Auto��6    $	��✖��5   	   �� 5   
   -   5         ��Name$ editUserLabel��5        SendingMessageToTheClient#���  6'   $��15(�6]   $��10,10,228,556q�6k   $
��Bold"�6�   #���   6�   �� 5   
   $��16(�6   $��Normal"�6"   $��WrapWithOverflow=�66   $��	0,243,0,0q�6V   $��Center=�6i   $	��Top=�6�   $	��580��6�   $��32��6�   �� 5      $+�%Итоговая стоимость: ��6
    �� 5      �6
   �� *
TotalPrice+5      �� 5    
   $��16(�6   $��Normal"�6"   $��WrapWithOverflow=�66   $��	0,147,0,0q�6V   $��Center=�6i   $	��Top=�6�   $	��580��6�   $��32��6�   �� 5!      $4�.Способ получения заказа: ��6    �� 5"      �6   �� *DeliveryType+5#      �� 5%   
   $��16(�6   $��Normal"�6"   $��WrapWithOverflow=�66   $��	0,179,0,0q�6V   $��Center=�6i   $	��Top=�6�   $	��580��6�   $��32��6�   �� 5&      $'�!Заказанные блюда: ��6
    �� 5'      �6
   �� *ProductInfo+5(      �� 5*   
   $��16(�6   $��Normal"�6"   $��WrapWithOverflow=�66   $��	0,211,0,0q�6V   $��Center=�6i   $	��Top=�6�   $	��580��6�   $��32��6�   �� 5+      $8�2Статус заказа (измененный): ��6
    �� 5,      �6
   �� *Status+5-      �� 5/   
   $��16(�6   $��Normal"�6"   $��WrapWithOverflow=�66   $��	0,275,0,0q�6V   $��Center=�6i   $	��Top=�6�   $	��580��6�   $��32��6�   �� 6�   $0�*Сообщение от менеджера��6�   �� 6�   $� ��6�   �� 6�   $�:��6�   6�   �� 50   
   $��20(�6   $
��Bold"�6"   $��WrapWithOverflow=�64   $��0,73,0,0q�6T   $��Center=�6f   $	��Top=�6�   $	��580��6�   $��32��6�   �� 51       � Language$ ru-ru�6
   $�Здравствуйте��6    �� 52      $�, ��6
    �� 53      �6
   �� *	GivenName+54      �� 55   
   $��18(�6   $
��Bold"�6"   $��WrapWithOverflow=�64   $��	0,110,0,0q�6T   $��Center=�6g   $	��Top=�6�   $	��580��6�   $��32��6�   �� 56      $ ru-ru�6
   $*�$Информация о заказе��6   57      �� 58   
   $��18(�6   $��WrapWithOverflow=�59      $��
10,191,0,0q�5:      $
��Left=�5;      $	��Top=�5<      �� 6&   $ ru-ru�6*   6>   �� 5=   
   -   5        	 ��Name$	 messageFromTheManager��5=      $��16(�61   
 �� TextWrapping$

 Wrap=�6?   $��10,307,10,111q�6S   $	��100��6j   
���   �$��2q�5>      " �� VerticalScrollBarVisibility$
 Auto=�62    �� TextAlignment$
 Left=�6U   �� 5@   
   -   5          MaterialDesignRaisedButton#��[ 5@      $��30��5A      
�������$
��Bold"�5C        SendMessageToTheClient#���  5D      $��10,519,10,63q�5E      5G      5H      