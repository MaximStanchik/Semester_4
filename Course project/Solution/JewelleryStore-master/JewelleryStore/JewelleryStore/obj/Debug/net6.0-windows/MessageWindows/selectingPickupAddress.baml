   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:JewelleryStore.MessageWindowsJewelleryStore.MessageWindows  5   	   :    4JewelleryStore.MessageWindows.selectingPickupAddress   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:JewelleryStore.MessageWindows     5   	     � Title$  selectingPickupAddress��5   	   $	��200��5	   	   $	��200��5
   	    � 
ResizeMode$ NoResize=�5   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � WindowStartupLocation$ CenterScreen=�5   	    � Cursor 5   	   �� *Cursor+.��5      � .+�5   
   ��  �� CornerRadius$ 10��6   
�������   PrimaryHueLightBrush#���   5      $��2q�5      �� 5   
   -   5         ��Name$ OkButton��5        MaterialDesignRaisedButton#��[ 5      $��30��5      
�������$
��Bold"�5      $��OK��5      $��10,160,10,10q�5      5      �� 5    
   -   5         ! MaterialDesignFlatLightButton#��[ 5!      $��137,8,10,160q�5"      $
��Auto��5#      $	��✖��5$       J� RenderTransformOrigin$ 0.5,0.5&�5%      z�5&      V� 5'      .~�5(      �� 	 �� ScaleX$	 -1Q�6%   �� 5)      �� 5*      T� 5+      5,      5.      �� 5/   
   -   5        
 ��Name$
 editUserLabel��5/       
 Pickup#���  50      $��15(�51      $��10,8,91,160q�52      $
��Bold"�53      #���   54      �� 55   
   -   5         ��Name$ StatusComboBox��55      $��Center=�56      $	��Top=�57      $	��180��58      $��0,40,0,0q�59      .@�5:      ��   ChooseAdress#���  6    �� 
IsSelected$
 True��6D   �� 5;        Adress_1#���  6   �� 5<        Adress_2#���  6   5=      �� 5>   
     CommentOnTheOrder#���  6   $��WrapWithOverflow=�5?      $��	10,70,0,0q�5@      $
��Left=�5A      $	��Top=�5B       �� TextAlignment$ Justify=�5C      �� 5D   
   $
��Auto=�6   $��10,91,10,50q�6:   .��5E      �� -   5         ��Name$ CommentTextBox��5E      
���   �$��2q�5G      " �� VerticalScrollBarVisibility$
 Auto=�5H       �� AcceptsReturn$
 True��5I       �� TextWrapping$
 Wrap=�5J      5K      5L      5M      