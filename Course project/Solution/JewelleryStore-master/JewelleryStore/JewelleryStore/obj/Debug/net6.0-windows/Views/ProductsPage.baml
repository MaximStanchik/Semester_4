   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5      !    JewelleryStore.ProductsPage   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      (localclr-namespace:JewelleryStore  5      -   5          N�Name$  ProductsPageView��5       N� Title$ ProductsPage��5       � Cursor 6   �� *Cursor+ � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter  StackPanelStyle �� 
TargetType �� Property �� Value �� Triggers P� Property	 P� Value  
ImageStyle  ButtonStyle
 �� 
TargetType��%�  &	        &	      &	 �    &	 ^      5   
   6$   �� 5   
   StackPanelStyle��" ��6A   .�5      ��  �@��Orientation$ Vertical=�6,   �� 5       � ��$	 210��6'   �� 5       � ��$	 165��6&   �� 5       � ��$ 0q�6'    5      P� 5       �@J�IsMouseOver$
	 True��61   . �5      ��  � �� �#EFEFEF63   5      P� 5       �@J�IsMouseCaptureWithin$
	 True��6:   . �5      ��  � �� �#EFEFEF63   5      5      �� 5   
   
ImageStyle��" ��67   .�5       ��  � ��$ UniformToFill=�6(   �� 5!       � ��$	 150��6&   �� 5"       � ��$	 150��6'   �� 5#       � ��$ 3q�6'    5$      P� 5%       �@J�IsMouseOver$
	 True��67   . �5&      ��  � ��$
 Fill=�60   �� 5'       � ��$	 152��6/   �� 5(       � ��$	 152��6.   5)      5+      �� 5-   
   ButtonStyle��" ��69   .�5.      ��  � ��$	 210��6'   �� 5/       � ��$	 165��6&   �� 50       � ��$ 3q�6'   �� 51       � ��
 ���� 6+   �� 52       � ��
 ���� 6,   �� 54       � �� 55      �� 56      "
 ��6&   .R�57      � #��z��6   .+�58      �� 59      5:      5<       5=      P� 5>       �@J�IsMouseOver$
	 True��61   . �5?      ��  � �� �#EFEFEF63   �� 5@       � ��
 ���� 64   5B      P� 5C       � ��$
	 True��6/   . �5D      ��  � �� �#EFEFEF63   5E      5H      5I      .��5K      � 
������� � RowDefinitions 5L   
   �� 5M      $
��Auto �6   �� 5N      $
��Auto �6   �� 5O      $
��Auto �6   �� 5P      $
��Auto �6   �� 5Q      $
��Auto �6    � ColumnDefinitions 5T   
   �� 5U      $
��160* �6   �� 5V      $
��160* �6   �� 5W      $
��160* �6   �� 5X      $
��160* �6   �� 5Y      $
��160* �6   .+�5^   
   �� $��0��6   $��0��6!    # MaterialDesignRaisedLightButton#��[ 5_        Add#���  5`      
�������$��	5,10,5,10q�5a   (   ��5^   .   �� *
AddCommand+ 6M   �� *Cursor+5a   (   �� 5c   
   -   5         ��Name$ editBtn��5c      $��1��5d      $��0��6!    " MaterialDesignPaperLightButton#��[ 5e        Edit#���  5f        PrimaryHueLightBrush#���  5g       J� RenderTransformOrigin$ 
0.71,0.547&�5h   9   $��	5,10,5,10q�6\   ��5c   "   �� *EditCommand+ 5d   .   �� *Cursor+{�5h      �� *EditButtonEnabled+6\   �� 5j   
   -   5        $ 	deleteBtn��5j      $��11(�5k      $��2��5m      $��0��6"   #��[ 5n       
	 Delete#��� 	 5o      #���  5p      $��	5,10,5,10q�5q   <   ��5l      �� *DeleteCommand+ 5o   5   �� *Cursor+{�5q      �� *DeleteButtonEnabled+6<   �� 5s   
   -   5         ��Name$ SearchField��5t      $��3��5s       %
 !MaterialDesignFloatingHintTextBox#��[
 5u      $��Center=�5v      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton$
 True��5w      $��
15,0,15,10q�6G   $��42��6[   $��2��6g   ��5s   "   �� *	SearchKey+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�.��5w   |   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5y      �� 5{       �� Orientation$ 
Horizontal=�6   $��-2 0 0 0q�68   .+�5|      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�64   �� 5}       
 Search#���  6    5~      .��5�   .   5�      �� 5�   
   -   5         ��Name$ scrollBarViewer��5�   <   $��Hidden=�6   $��10,35,10,10q�6U   $��0��6j   $��5��6z   $��2��6�   $��3��6�   .��5�      �� ��6   �� *
Products+$ TwoWay=�$ Explicit=���5�      �� 5�      .R�5�      �� #��[ 6k   y�6!   �� *	IsVisible+ �� 	Converter# [  '   !JewelleryStore.AttachedProperties   Name 6�   �� *Id+ �� StringFormat$ btn{0}����6�   ��  �� RelativeSource ��  �� AncestorType" �� �� Path$# DataContext.SelectItemCommand���6O  ��  �� *Self+.��5�      �� #��[ 6)   .+�5�   "   �� #��[ 6A   ��6(   �� *Image+6A   �� 5�   "   $��Center=�6(   $��11(�6E   $��DemiBold"�6S   ��6i   �� *Name+6�   �� 5�   "   $��Center=�6(   $��11(�6E   ��6S   �� *Price+6o   5�      5�      5�      ��5�      �� 5�      .R�5�      �  �Name$ products��6$   5�      5�      5�      �� 5�   
   -   5         ��Name$ 	PriceSort��5�      $��1��6�   $��0��6�    	 Price# �  6�   $��26��6�   $��	20,0,10,0q�6�   ��6&   �� *SortOptions+ �� SelectedIndex 6J   �� *SelectedPriceOption+$ TwoWay=�6�   �� 5�   
   -   5        $ TypeSort��5�        Type# �  6�   $��	15,0,15,0q�6�   $��1��6�   $��1��6�   $��26��6�   ��6%   �� *TypeOptions+ 6I   �� *SelectedTypeOption+$ TwoWay=�6�   �� 5�   
   -   5        $ 
WeightSort��5�       
 Weight# �  6�   $��	15,0,15,0q�6�   $��1��6�   $��2��6�   $��26��6�   ��6'   �� *SortOptions+ 6K   �� *SelectedWeightOption+$ TwoWay=�6�   �� 5�   
   -	   5        $ 	MetalSort��5�       	 Metal# �  6�   $��	15,0,15,0q�6�   $��1��6�   $��3��6�   $��26��6�   ��6&   �� *MetalOptions+ 6K   �� *SelectedMetalOption+$ TwoWay=�6�   �� 5�   
   -
   5        $ 
InsertSort��5�       
 Insert# �  6�   $��	15,0,15,0q�6�   $��1��6�   $��4��6�   $��26��6�   ��6'   �� *InsertOptions+ 6M   �� *SelectedInsertOption+$ TwoWay=�6�   �� 5�   
   $��Light"�6   $
��Left=�6L   $��
20,5,0,282q�6g   $	��184��6{   $��2��6�   $��2��6�     d� 	IsChecked  6&   �� *ShowActiveOnly+.��5�      �� $��14(�6     ShowActiveOnly#���  6&   $	��Top=�6N   $��0,-3,0,0q�6f   5�      �� 5�   
   $��2��6     NothingFound#���  6    $��Center=�6�   $��	0,224,0,0q�6�   $��2��6�   $	��Top=�6�   y�6I   �� *NothingFoundVisibility+# [  6�   5�      5�      