   M S B A M L   `   `   `  ����@  <Lab07, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab07Lab07  5   	   clr-namespace:Lab07Lab07  5	   	   clr-namespace:Lab07Lab07  5
   	       Lab07.ProductDialog   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   localclr-namespace:Lab07  5   	   wclr-namespace:Lab07  5	   	   "controlsclr-namespace:Lab07  5
   	   -   5          �Name$  ProductDialogWindow��5   	    � Title$ ProductDialog��5   	   $	��692��6    $	��400��6-    � 
ResizeMode$ NoResize=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ w:Command.AddCommand��5      6P     5   
   -   5        $ w:Command.AddImageCommand��5      6S     5   
   -   5        $ w:Command.UpdateCommand��5      6X     5   
   -   5        $ w:Command.CloseCommand��5      6M   .��5      �� -   5        ���#80CBC4$��2q�5   #   ._�5   
   �  � ColumnDefinitions 5      �� 5      $
��200* �6#   �� 5      $
��200* �6#    � RowDefinitions 5      �� 5      $	��47* �6    �� 5      $	��47* �6    �� 5       $	��50* �6    �� 5!      $	��50* �6    �� 5"      $	��50* �6    �� 5#      $	��50* �6    �� 5$      $
��122* �6    �� 5%      $
��122* �6    �� 5&      $	��82* �6    .+�5)         Lab07.MessageControl  -   5        	  Name$	 
messageBox��5)   &   
 K� ZIndex$
 99��6:   $��3��6�   $��70,31,76,121q�6�   $��2��6�   $��4��6�      TextMessage 6L   �� *	message+ �� Mode$ OneWay=� �� ElementName$ ProductDialogWindow��6�   �� 5+      -   5         ��Name$ nameFieldRus��5+      $��1��6,   $	��350��69   $��40��6E   $��1��6Q    %  !MaterialDesignFloatingHintTextBox#��[  5,        ProductNameRus)  #MaterialDesignThemes.Wpf.HintAssist   Hint# �  5-      $
��Left=�5.      $	��Top=�6-   $��20,0,0,0q�6E   $��2��6W   �� 50      -	   5        $ 
priceField��50      $��3��6+   $	��350��68   $��3��6D   $��40��51      #��[  52       	 Price# �  53      $
��Left=�54      $	��Top=�6/   $��18,6,0,0q�6G   $��2��6Y   �� 55      -
   5         ! MaterialDesignFlatLightButton#��[ 56      $
��Auto��57      $��1��6   $��
142,0,0,20q�6A   .��58      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   59      �� 5:      -   5        $ quantityField��5:      $��4��6.   $	��350��6;   $��4��6G   $��40��5;      #��[  5<        Quantity# �  5=      $
��Left=�5>      $	��Top=�6/   $��18,7,0,0q�6G   $��2��6Y   �� 5@      -   5         ��Name$ ProductType��5B      $��5��5@       1 -MaterialDesignChoiceChipPrimaryOutlineListBox#��[ 5A      $��20,5,-10,121q�5B   &   $��2��6<   $��2��6M   .@�5C      �� -   5         ��Name$ type1��5C      $��5��6-     	Necklaces#���  5D      �� 5E      -   5        $ type2��5E      $��6��6-    	 Rings#���  5F      �� 5G      -   5        $ type3��5G      $��7��6-     Earrings#���  5H      �� 5I      -   5        $ type4��5I      $��8��6.    	 	Wristwear#��� 	 5J      5K      �� 5Q      -   5         ��Name$ image��5Q      $��7��6'   $	��100��64   $	��100��6@   $��55,17,43,18q�6M    J� 	AllowDrop$
 True��6b    
 PrimaryHueLightBrush#��� 
 5R   D    �� StrokeDashArray$ 3R�6t   $��1��6�   5S      �� 5T      $��w:Command.AddImageCommand��6   $��11��69     	MidButton#��[ 5U        AddImage#���  5V      $��44,51,183,52q�68   $��7��6N   $��2��6[   �� 5Z      -   5         ��Name$ EditBtn��5Z      $��w:Command.UpdateCommand��6&   $��12��6H   #��[ 5[        Edit#���  5\      $��85,26,97,25q�6,   $��8��6A   $��40��6N   $��2��6Z   �� 5_      -   5        $ AddBtn��5_      $��w:Command.AddCommand��6%   $y�	Collapsed=�6D   $��12��6[   #��[ 5`        Add#���  5a      $��85,26,97,25q�6+   $��8��6@   $��40��6M   $��2��6Y   �� 5c      -   5        $ nameFieldEn��5c      $��2��6+   $	��350��68   $��40��6D   $��2��6P   #��[  5d        ProductNameEn# �  5e      $
��Left=�5f      $	��Top=�6,   $��20,7,0,0q�6D   $��2��6V   �� 5g      -   5        $ descriptionFieldRus��5g      $��6��63   $	��178��6@   $	��115��6L    �� TextWrapping$
 Wrap=�6Y   $��9��6m   #��[  5h        ProductDescriptionRus# �  5i      $
��Left=�5j      $��Center=�6,   $��20,0,0,0q�6G   �� 5k      -   5        $ descriptionFieldEn��5k      $��6��62   $	��178��6?   $	��115��6K   $
 Wrap=�6X   $��10��6l   #��[  5l        ProductDescriptionEn# �  5m      $
��Left=�5n      $��Center=�6,   $��1��6G   $��15,0,0,0q�6W   5r      5s      5t      