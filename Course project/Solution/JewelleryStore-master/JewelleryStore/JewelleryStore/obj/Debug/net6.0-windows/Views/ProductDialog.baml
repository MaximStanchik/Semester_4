   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	   "    JewelleryStore.ProductDialog   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   (localclr-namespace:JewelleryStore  5   	     � Title$  ProductDialog��5	   	   $	��692��6    $	��800��6-    � 
ResizeMode$ NoResize=�5
   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � Cursor 6   �� *Cursor+ � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter��%   &	          5   
   6$   5      .��5      ��   PrimaryHueLightBrush#���  6   $��2q�6B   ._�5   
   �  � ColumnDefinitions 5      �� 5      $
��400* �6#   �� 5      $
��400* �6#    � RowDefinitions 5      �� 5      $	��47* �6    �� 5      $	��47* �6    �� 5      $	��50* �6    �� 5      $	��50* �6    �� 5      $	��50* �6    �� 5      $
��122* �6    �� 5      $
��122* �6    �� 5      $	��82* �6    .+�5!      �� -   5         ��Name$ nameFieldRus��5!      $��1��6,   $	��350��69   $��40��6E   $��1��6Q    % !MaterialDesignFloatingHintTextBox#��[ 5"        ProductNameRus)  #MaterialDesignThemes.Wpf.HintAssist	   Hint#	 �  5#      $
��Left=�5%      $	��Top=�6-   $��20,0,0,0q�6E   $��2��6W   ��5$      �� *	WordRus+
 �� Mode$
 TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5%   W   �� 5'      -   5        $ 
priceField��5'      $��2��6+   $	��350��68   $��3��6D   $��40��5(      #��[ 5*       	 Price#	 �  5+      $
��Left=�5,      $	��Top=�6/   $��18,6,0,0q�6G   ��5)      �� *Price+$
 TwoWay=�$ PropertyChanged=�5,   G   �� 5.      -   5        $ quantityField��5.      $��2��6.   $	��350��6;   $��4��6G   $��40��5/      #��[ 50        Quantity#	 �  51      $��Center=�52      $	��Top=�61   $��0,6,0,0q�6I   $��1��6Z   ��5/   !   �� *
Quantity+$
 TwoWay=�$ PropertyChanged=�52   Z   �� 54      -   5         ��Name$ ProductType��56      $��6��54       1 -MaterialDesignChoiceChipPrimaryOutlineListBox#��[ 55      $��38,23,38,70q�56   &   $��1��6;    �� SelectedIndex 54   #   �� *ProductType+.@�57      �� -   5         ��Name$ type1��57      $��12��6-     	Necklaces#���  58      �� 59      -   5        $ type2��59      $��13��6-    	 Rings#���  5:      �� 5;      -   5        $ type3��5;      $��14��6-    	 Earrings#��� 	 5<      �� 5=      -   5        $ type4��5=      $��15��6.    
 	Wristwear#��� 
 5>      5?      �� 5B       ! MaterialDesignFlatLightButton#��[ 5C      $��
332,5,0,15q�5D      $
��Auto��6"   $��1��60   ��5B      �� *CloseCommand+.��5E      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5F      �� 5H      -	   5         ��Name$ image��5H      $��6��6'   $	��100��64   $	��100��6@   $��250,17,48,18q�6M    J� 	AllowDrop$
 True��6c    �� StrokeDashArray$ 3R�5J   1   $��0��6E   ��5I      �� *RectFillBrush+��5J      �� *RectStrokeBrush+5K      �� 5L      $��11��6   #��[ 5M        AddImage#���  5N      $��44,51,183,52q�68   $��6��6N   $��0��6[   ��5L   #   �� *AddImageCommand+5N   [   �� 5R      -
   5         ��Name$ EditBtn��5R      $��12��6&    % !MaterialDesignOutlinedLightButton#��[ 5T        Edit#���  5U      $��85,26,97,25q�6,   $��8��6A   $��40��6N   $��2��6Z   ��5R   4   �� *EditCommand+y�5S      �� *EditButtonVisibility+ �� 	Converter# [  5U   Z   �� 5X      -   5        $ AddBtn��5X      $��12��6y   #��[ 5Y        Add#���  5Z      $��85,26,97,25q�6+   $��8��6@   $��40��6M   $��2��6Y   y�5X   %   �� *AddButtonVisibility+# [  ��6�   �� *
AddCommand+5Z   Y   �� 5\      -   5        $ nameFieldEn��5\      $��1��6+   $	��350��68   $��40��6D   $��2��6P   #��[ 5^        ProductNameEn#	 �  5_      $��Center=�5`      $	��Top=�6.   $��0,2,0,0q�6F   $��1��6W   ��5]      �� *WordEn+$
 TwoWay=�$ PropertyChanged=�5`   W   �� 5a      -   5        $ descriptionFieldRus��5a      $��5��63   $	��348��6@   $	��115��6L    �� TextWrapping$
 Wrap=�6Y   $��9��6m   #��[ 5b        ProductDescriptionRus#	 �  5d      $
��Left=�5e      $��Center=�6,   $��18,0,0,0q�6G   ��5c      �� *DescriptionRus+$
 TwoWay=�$ PropertyChanged=�5e   G   �� 5f      -   5        $ descriptionFieldEn��5f      $��5��62   $	��348��6?   $	��115��6K   $
 Wrap=�6X   $��10��6l   #��[ 5g        ProductDescriptionEn#	 �  5i      $��Center=�5j      $��Center=�6.   $��1��6I   ��5h      �� *DescriptionEn+$
 TwoWay=�$ PropertyChanged=�5j   I   �� 5k      -   5        $ weightField��5k      $��3��6,   $	��350��69   $��5��6E   $��40��5l      #��[ 5n       
 Weight#	 �  5o      $
��Left=�5p      $	��Top=�6,   $��20,5,0,0q�6D   ��5m      �� *Weight+$
 TwoWay=�$ PropertyChanged=�5p   D   �� 5r      -   5         ��Name$ stoneInsert��5r      $	��350��6,   $��40��68   $��6��6D    & "MaterialDesignFloatingHintComboBox#���  5s   g    
 Insert#	 �  6�   $��1��6�   $��	24,5,24,0q�6�   $��3��6  $	��Top=�6  ��5r   R   �� *Stones+ �� SelectedItem 5s      �� *SelectedStone+$
 TwoWay=�$ PropertyChanged=�6(  �� 5t      -   5        $ metalBox��5t      $	��350��5u   g   $��40��6s   $��7��6   #���  6�    	 Metal#	 �  6�   $��	20,0,28,0q�6  $��4��6  ��5t   )   �� *Metals+ 5u      �� *SelectedMetal+$
 TwoWay=�$ PropertyChanged=�6  �� 5v      -   5        $ metalSampleField��5v      $��4��61   $	��350��6>   $��8��6J   $��40��5w      #��[ 5y        MetalSample#	 �  5z      $
��Left=�5{      $��Center=�6,   $��1��6G   $��24,0,0,0q�6W   ��5x      �� *MetalSample+$
 TwoWay=�$ PropertyChanged=�5{   W   �� 5|      $��Light"�6   $
��Left=�6�   $��
38,73,0,12q�6�   $	��184��6�   $��1��6�   $��6��6�    d� 	IsChecked 6*   �� *ProductActive+$
 TwoWay=�$ PropertyChanged=�{�6�   �� *CheckboxAciveEnabled+.��5}      �� $��14(�6    
 Active#���  6*   $	��Top=�6J   $��0,-3,0,0q�6b   5~      �� 5        ErrorProductPrice#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��	14,49,0,0q�6�   $��2��6�   $	��Top=�6�   $	��350��6  $��2��6!  y�6B   �� *ErrorPriceVisibility+# [  6!  �� 5�        ErrorProductQuantity#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��2��6�   $��Center=�6�   $	��350��6  $��2��6#  $��1��64  $��22,0,0,0q�6D  y�6E   �� *ErrorQuantityVisibility+# [  6D  �� 5�        ErrorProductWeight#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��	14,43,0,0q�6�   $��3��6�   $	��Top=�6�   $	��350��6  $��2��6#  y�6C   �� *ErrorWeightVisibility+# [  6#  �� 5�        ErrorMetalSample#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��4��6�   $	��Top=�6�   $	��350��6  $��1��6  $��	22,47,0,0q�6/  $��2��6B  y�6A   �� *ErrorMetalSampleVisibility+# [  6B  �� 5�        ErrorProductName#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��	14,38,0,0q�6�   $��1��6�   $	��Top=�6  $	��350��6  $��2��6)  y�6A   �� *ErrorProductNameRusVisibility+# [  6)  �� 5�      #���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��	22,38,0,0q�6�   $��1��6�   $	��Top=�6  $	��350��6  $��2��6(  $��1��69  y�6A   �� *ErrorProductNameEnVisibility+# [  69  �� 5�        
ErrorMetal#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��	14,49,0,0q�6�   $��4��6�   $	��Top=�6�   $	��350��6  $��2��6  y�6;   �� *
ErrorMetal+# [  6  �� 5�        ErrorStoneInsert#���  6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��3��6�   $	��Top=�6�   $	��350��6  $��1��6  $��	22,45,0,0q�6  $��2��62  y�6A   �� *
ErrorStone+# [  62  �� 5�         ErrorProductType#���   6   
���  ��$
��Left=�6�   $��22��6�   $��10(�6�   $��6��6�   $	��Top=�6�   $	��258��6	  $��1��6  $��	39,59,0,0q�6%  y�6A   �� *ErrorProductType+# [  6%  5�      5�      5�      