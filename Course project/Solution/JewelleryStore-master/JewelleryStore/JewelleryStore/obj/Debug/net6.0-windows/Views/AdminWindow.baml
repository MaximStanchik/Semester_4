   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	        JewelleryStore.AdminWindow   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   (localclr-namespace:JewelleryStore  5   	     � 
ResizeMode$  NoResize=�5	   	    � Title$ Admin��5
   	   $
��1200��61   $	��600��6>    � WindowStyle$
 None=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � Cursor 5
      �� *Cursor+ � 	Resources 5       �� Source�� 5   
   $ /Resources/Styles.xaml?�6   %    .��5      �    MaterialDesignPaper#���   6    � ColumnDefinitions 5   
   �� 5      $
��267* �6   �� 5      $
��663* �6   �� 5      $
��267* �6    � RowDefinitions 5   
   �� 5      $	��30* �6   �� 5      $	��80* �6   .+�5   
   �� $��0��6   $��6��6$   	 J� Opacity$		 0.3Q�65     PrimaryHueLightBrush#���  6C   +  %MaterialDesignThemes.Wpf.ShadowAssist
   ShadowDepth$
 Depth2=�5          ShadowEdges$ Right=�5!      �� 5$   
   -   5         ��Name$ ProductsBtn��5$      $��1��6&    ! MaterialDesignFlatLightButton#��[ 5&        Products#���  5'       �� 	IsDefault$
 True��5(        PrimaryHueMidBrush#���  5)      $	��Top=�5*      $��50��5,      $��
0,10,664,0q�6   $��2��61   ��5%      �� *ShowProductsCommand+ 5+      �� *Cursor+5,   1   �� 5-   
   -   5        $ StockBtn��5-      $��1��6#   #��[ 5/       	 Stock#���  50      #���  51      $	��Top=�52      $��50��54      $��
0,60,664,0q�6    J� RenderTransformOrigin$ 
0.5,-0.736&�62   $��2��6U   ��5.      �� *ShowStockCommand+ 53      �� *Cursor+54   U   �� 56   
   $��1��6   $��2��57      $
��Left=�6    �� Orientation$ Vertical=�58      $	��178��59      $��59,10,0,272q�6   .+�5:      	�    MaterialDesignTabRadioButton#��[ 5;      $��4q�5<      
 � Tag$ Theme1��5=        Blue#���  5@      ��5>      �� *SwitchThemeCommand+��5?      �� *Tag+ �� RelativeSource �� *Self+ 5@   2   �� *Cursor+	� 5A      #��[ 5B      $��4q�5C      $ Theme2��5D       d� 	IsChecked$ FalseY�6     Red#���  5G      ��5E      �� *SwitchThemeCommand+��5F      �� *Tag+ �� *Self+ 5G   1   �� *Cursor+	� 5H      #��[ 5J      $��4q�5K      $ FalseY�5N      $ Theme3��6#    		 Brown#��� 	 5O      $��8��63    5I      �� *Cursor+��5L      �� *SwitchThemeCommand+��5M      �� *Tag+ �� *Self+5O   3   5P      �� 5U   
   $��/images/logotype.png��6   $��0��6.   $��	10,6,9,96q�6>   $��1��6S   $ 0.507,0.544&�6g    � 5Y   
   -   5          �Name$ myFrame��5Y   C   #���   6     � NavigationUIVisibility$ Hidden=�6T   $��1��6t   $��2��6�   $��	0,0,228,0q�6�   $��2��6�     � Source 6�   �� *Page+6�   #  MaterialDesignThemes.Wpf.Chip  5\   
   $��2��6   $��Admin��5]         Icon$ A��5^      $��90,21,0,111q�6   $	��116��6+    5]      �� *Cursor+5^   +   d� 5a   
    $
  MaterialDesignActionToggleButton#��[
 5b      $��RU��5c      $��11(�6    $��Center=�5d      1  +MaterialDesignThemes.Wpf.ToggleButtonAssist   	OnContent$ EN��5h       �� Left$	 291��6B   
 �� Top$	 321��6T   $��32��6e   $��32��6q   $
 Depth1=�5i      $��132,153,0,0q�5j      $	��Top=�6&   $
��Left=�6>   $��1��6Y   $��2��6f    5e      �� *Cursor+ 5f      �� *	LangCheck+��5g      �� *SwitchLangCommand+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5j   f   �� 5k   
   $��1��5l      $	��Top=�6     MaterialDesignIconButton#��[ 5m      $��	0,316,0,0q�5n      $��48��6$   $ 	0.493,0.5&�6/   $��Center=�6Q   $��48��6n   ��5k      �� *CloseCommand+ 62   �� *Cursor+.��5o      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Logout=�5p      5q      �� 5r   
   -   5        $ 	AccManBtn��5r      $��1��6$   #��[ 5t       
 AccMan#���  5u      #���  5v      $	��Top=�5w      $��50��5y      $��0,160,664,0q�6   $ 
0.5,-0.736&�6.   $��2��6Q   ��5s      �� *ShowAccCommand+ 5x      �� *Cursor+5y   Q   �� 5z   
   -   5        $$ AccManBtn_Копировать��5z      $��1��6/   #��[ 5|        AccUser#���  5}      #���  5~      $	��Top=�5      $��50��5�      $��0,210,664,0q�6   $ 
0.5,-0.736&�6.   $��2��6Q   ��5{      �� *ShowUserAccCommand+ 5�      �� *Cursor+5�   Q   �� 5�   
   -   5        $% AccManBtn_Копировать1��5�      $��1��60   #��[ 5�        DeletePromo#���  5�      #���  5�      $	��Top=�5�      $��50��5�      $��0,110,664,0q�6   $ 
0.5,-0.736&�6.   $��2��6Q   ��5�      �� *ShowPromotionsFromDB+ 5�      �� *Cursor+5�   Q   �� 5�   
   -   5        $ ViewOrdersBtn��5�      $��1��6(   #��[ 5�        	OrderList#���  5�      #���  5�      $	��Top=�5�      $��50��5�      $��-1,260,664,0q�6   $ 
0.5,-0.736&�6/   $��2��6R   ��5�      �� *ShowOrderListCommand+ 5�      �� *Cursor+5�   R   5�      5�      