   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	       JewelleryStore.Message   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:JewelleryStore     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � Title$ 
MessageBox��5	   	   $	��150��5
   	   $	��250��5   	    � 
ResizeMode$ NoResize=�5   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � Cursor 5   	   �� *Cursor+ � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter��%   &	          5   
   6$   5      .��5      �  � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   ��  �� CornerRadius$ 10��6   $��2��6#   
�������  PrimaryHueLightBrush#���  6L   $��2q�6�   5      �� 5    
   $��Hidden=�6   .��5!      �� $��18(�6   $��WrapWithOverflow=�6?   $��15q�6_   $��Center=�6k   $��Center=�6�   	 �� TextAlignment$	 Justify=�6�   ��6&   �� *	Message+6�   5"      �� 5#   
   -   5        $��ButtonContainer��5#      $��1��6,   
 �� Orientation$
 
Horizontal=�69   $��Center=�5$      $��0,10.4,0,10q�62   .+�5%      �� $
��true��66     MaterialDesignRaisedButton#��[ 5&      $	��107��5'      $��30��6   
�������$
��Bold"�5(   $   $��OK��66   ��5%      �� *CloseCommand+ 5'   )   �� *Cursor+5(   6   �� 5)      $��false��5*        MaterialDesignFlatButton#��[ 5+      $	��107��5,      $��30��6   $��10,0,0,0q�6*   $
��Bold"�5-       
 Cancel#���  6#   ��5)      �� *CloseCommand+y�66   �� *CancelButVis+ �� 	Converter# [   5*   .   �� *Cursor+5-   #   5.      5/      50      