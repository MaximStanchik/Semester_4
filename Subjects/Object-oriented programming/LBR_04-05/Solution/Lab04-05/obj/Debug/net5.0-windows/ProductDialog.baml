   M S B A M L   `   `   `  ����C  ?Lab04-05, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Lab04_05Lab04_05  5   	   #clr-namespace:Lab04_05Lab04_05  5   	       Lab04_05.ProductDialog   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   "localclr-namespace:Lab04_05  5   	   wclr-namespace:Lab04_05  5   	     � Title$  ProductDialog��5
   	   $	��692��6    $	��400��6-    � 
ResizeMode$ NoResize=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ w:Command.AddCommand��5      6P     5   
   -   5        $ w:Command.AddImageCommand��5      6S     5   
   -   5        $ w:Command.UpdateCommand��5      6X     5   
   -   5        $ w:Command.CloseCommand��5      6M   .��5      �� -   5        ���#80CBC4$��2q�5   #   ._�5   
   �  � ColumnDefinitions 5      �� 5      $
��200* �6#   �� 5      $
��200* �6#    � RowDefinitions 5      �� 5      $	��47* �6    �� 5      $	��47* �6    �� 5      $	��50* �6    �� 5      $	��50* �6    �� 5       $	��50* �6    �� 5!      $	��50* �6    �� 5"      $
��122* �6    �� 5#      $
��122* �6    �� 5$      $	��82* �6    .+�5'      �� -   5         ��Name$ nameFieldRus��5'      $��1��6,   $	��350��69   $��40��6E   $��1��6Q    %  !MaterialDesignFloatingHintTextBox#��[  5(        ProductNameRus)  #MaterialDesignThemes.Wpf.HintAssist	   Hint#	 �  5)      $
��Left=�5*      $	��Top=�6-   $��20,0,0,0q�6E   $��2��6W   �� 5,      -   5        $ 
priceField��5,      $��3��6+   $	��350��68   $��3��6D   $��40��5-      #��[  5.       	 Price#	 �  5/      $
��Left=�50      $	��Top=�6/   $��18,6,0,0q�6G   $��2��6Y   �� 52      -   5        $ quantityField��52      $��4��6.   $	��350��6;   $��4��6G   $��40��53      #��[  54        Quantity#	 �  55      $
��Left=�56      $	��Top=�6/   $��18,7,0,0q�6G   $��2��6Y   �� 58      -	   5        
 ��Name$
 ProductType��5:      $��5��58       1 -MaterialDesignChoiceChipPrimaryOutlineListBox#��[ 59      $��20,5,-10,121q�5:   &   $��2��6<   $��2��6M   .@�5;      �� -
   5         ��Name$ type1��5;      $��5��6-     	Necklaces#���  5<      �� 5=      -   5        $ type2��5=      $��6��6-    	 Rings#���  5>      �� 5?      -   5        $ type3��5?      $��7��6-     Earrings#���  5@      �� 5A      -   5        $ type4��5A      $��8��6.     	Wristwear#���  5B      5C      �� 5E      $��w:Command.CloseCommand��6    !	 MaterialDesignFlatLightButton#��[	 5F      $��
148,5,0,15q�5G      $
��Auto��6"   $��1��60   .��5H      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5I      �� 5K      -   5         ��Name$ image��5K      $��7��6'   $	��100��64   $	��100��6@   $��55,17,43,18q�6M    J� 	AllowDrop$
 True��6b    
 PrimaryHueLightBrush#��� 
 5L   D    �� StrokeDashArray$ 3R�6t   $��1��6�   5M      �� 5N      $��w:Command.AddImageCommand��6   $��11��69     	MidButton#��[ 5O        AddImage#���  5P      $��44,51,183,52q�68   $��7��6N   $��2��6[   �� 5T      -   5         ��Name$ EditBtn��5T      $��w:Command.UpdateCommand��6&   $��12��6H   #��[ 5U        Edit#���  5V      $��85,26,97,25q�6,   $��8��6A   $��40��6N   $��2��6Z   �� 5Y      -   5        $ AddBtn��5Y      $��w:Command.AddCommand��6%   $y�	Collapsed=�6D   $��12��6[   #��[ 5Z        Add#���  5[      $��85,26,97,25q�6+   $��8��6@   $��40��6M   $��2��6Y   �� 5]      -   5        $ nameFieldEn��5]      $��2��6+   $	��350��68   $��40��6D   $��2��6P   #��[  5^        ProductNameEn#	 �  5_      $
��Left=�5`      $	��Top=�6,   $��20,7,0,0q�6D   $��2��6V   �� 5a      -   5        $ descriptionFieldRus��5a      $��6��63   $	��178��6@   $	��115��6L    �� TextWrapping$
 Wrap=�6Y   $��9��6m   #��[  5b        ProductDescriptionRus#	 �  5c      $
��Left=�5d      $��Center=�6,   $��20,0,0,0q�6G   �� 5e      -   5        $ descriptionFieldEn��5e      $��6��62   $	��178��6?   $	��115��6K   $
 Wrap=�6X   $��10��6l   #��[  5f        ProductDescriptionEn#	 �  5g      $
��Left=�5h      $��Center=�6,   $��1��6G   $��15,0,0,0q�6W   5l      5m      5n      