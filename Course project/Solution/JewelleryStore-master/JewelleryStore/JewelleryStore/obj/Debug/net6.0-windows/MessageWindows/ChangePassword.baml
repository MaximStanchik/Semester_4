   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	   #    JewelleryStore.ChangePassword   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   .localclr-namespace:JewelleryStore     5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  	UserEnter��5   	   $	��290��6   $	��250��5   	    � 
ResizeMode$ NoResize=�5   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � WindowStartupLocation$ CenterScreen=�5   	    � Cursor 5
   	   �� *Cursor+.��5      �  � RowDefinitions 5   
   �� 5      $��239.6 �6   �� 5      $
��Auto �6   .+�5   
   ��  �� CornerRadius$ 10��6   $��2��6#   
�������   PrimaryHueLightBrush#���   6L   $��2q�6�   5      �� 5   
     Password#���  6   $��18(�66   $��WrapWithOverflow=�6D    �� TextAlignment$ Center=�6d   $��10,10,10,155q�6{   G� 5   
    ) %MaterialDesignFloatingHintPasswordBox#���  6   )  #MaterialDesignThemes.Wpf.HintAssist	   Hint#	 �  6W   $��0,45,0,0q�6�   $��Center=�6�   $	��Top=�6�   $	��200��6�   $��40��6�   *  $Microsoft.Xaml.Behaviors.Interaction
   	Behaviors
 5      %   JewelleryStore.PasswordBehavior  5         Password 6)   �� *	Password1+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5!      G� 5"   
   #���  6     RepeatPassword#	 �  6W   $��0,90,0,0q�6�   $��Center=�6�   $	��Top=�6�   $	��200��6�   $��40��6�   
 5#        5$       6)   �� *	Password2+$ TwoWay=�$ PropertyChanged=�5&      �� 5'   
   -   5        $��ButtonContainer��5'      $��1��6,    �� Orientation$ 
Horizontal=�69   $��Center=�5(      $��0,10.4,0,10q�62   .+�5)      ��   MaterialDesignRaisedButton#��[ 5*      $	��107��5+      $��30��6   
�������$
��Bold"�5,   $   $��OK��66   ��5)      �� *CheckPassCommand+ 5+   )   �� *Cursor+5,   6   �� 5-        MaterialDesignFlatButton#��[ 5.      $	��107��5/      $��30��6   $��10,0,0,0q�6*   $
��Bold"�50       
 Cancel#���  6#   ��5-      �� *CloseCommand+ 5/   <   �� *Cursor+50   #   51      �� 52   
   $��10(�61   $��22��6?   $��25,132,25,85q�6K   
���  ����6   �� *ErrorMessage+6a   �� 53   
   $��WrapWithOverflow=�6     PasswordRules#���  64   $��13(�6[   
�������$��25,155,25,12q�6{   54      55      