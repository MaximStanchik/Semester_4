   M S B A M L   `   `   `  ����C  ?Lab04-05, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Lab04_05Lab04_05  5   	   #clr-namespace:Lab04_05Lab04_05  5	   	       Lab04_05.MainWindow   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   "localclr-namespace:Lab04_05  5   	   wclr-namespace:Lab04_05  5	   	     � WindowStartupLocation$  CenterScreen=�5
   	    � Title$ Admin��5   	   $	��600��6   $	��900��6$    � 	Resources 5       �� Source�� 5   
   $ Resources/Styles.xaml?�6   %     J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$! w:Command.SwitchLangCommand��5      6W     5   
   -   5        $ w:Command.ShowCommand��5      6S   .��5      �    MaterialDesignPaper#���   6    � ColumnDefinitions 5   
   �� 5      $
��160* �6   �� 5      $
��527* �6   �� 5      $
��207* �6    � RowDefinitions 5   
   �� 5      $	��68* �6   �� 5      $	��71* �6   �� 5      $
��213* �6   �� 5       $
��140* �6   �� 5!      $	��31* �6   .+�5%   
   �� $��0��6   $��6��6$    J� Opacity$	 0.3Q�65     	FillBrush#��[ 6C   +  %MaterialDesignThemes.Wpf.ShadowAssist	   ShadowDepth$	 Depth2=�5&      
   ShadowEdges$
 Right=�5'      �� 5*   
   -   5         ��Name$ ProductsBtn��5*      $��2��6&   $��w:Command.ShowCommand��5+        LightButton#��[ 5,        Products#���  5-       �� 	IsDefault$
 True��5.      $	��Top=�5/      $��50��50      $��0,29,0,0q�6   �� 57   
   $��/images/logo.png��6   $��0��6*   $��10,11,10,10q�6:   $��1��6Q    J� RenderTransformOrigin$ 0.507,0.544&�6e   $��0��6�   �� 58   
   -   5         ��Name$ 	pageLabel��58      $��1��59      $��15(�6    $��10,10,435,10q�5:      $
��Bold"�5;      ���#36BEB3$��Center=�5<      $��28��6+    � 5A   
   -   5          �Name$ myFrame��5A   C   #���   6     � NavigationUIVisibility$ Hidden=�6T   $��0��6t   $��1��6�   $��4��6�   $��2��6�   5C      d� 5H   
   -   5         d�Name$
 Lang��5H       $  MaterialDesignActionToggleButton#��[ 5I      $��RU��5J      $��11(�6    $��Center=�5K      $
��Left=�5L      $!��w:Command.SwitchLangCommand��5M      1  +MaterialDesignThemes.Wpf.ToggleButtonAssist   	OnContent$ EN��5N       �� Left$	 291��6B   
 �� Top$	 321��6T   $��22��6e   $��23��6q   $	 Depth1=�5O      $��Center=�6B   $��4��6]   $��10,0,0,0q�6j   �� 5S   
   -   5         ��Name$ FirstSlider��5S       � Minimum$ 0Q�6&    � Maximum$	 200Q�62   $��7,124,13,79q�6p   $��2��6�    � Value 6@   �� *FirstSliderValue+ �� Mode$ TwoWay=�6�   �� 5T   
   $
��Left=�6   $��
121,98,0,0q�6/   $��2��6C   $	��Top=�6P   $��35��6h   
��������� 5U      �6
   ��  �� ElementName$ FirstSlider�� �� Path$ Value�5V      �� 5X   
   -   5        $ SecondSlider��5X      $
��Left=�6'   $��39��6B   $��	7,180,0,0q�6N   $��2��6a   $	��Top=�6n   $	��144��6�   $ 0Q�6�   $	 200Q�6�    6�   �� *SecondSliderValue+$ TwoWay=��� 5Y   
   -	   5         ��Name$ MaxPriceTextBlock��5Y      $
��Left=�6/   $��121,159,0,0q�6J   $��2��6_   $	��Top=�6l   $��35��6�   
��������� 5Z      �6
   �� $ SecondSlider��$ Value�5[      	� 5\   
   -
   5        $%��Включить фильтры��5\       	� 	GroupName$ turOnFilters��62   $
��Left=�6L    d� 	IsChecked$
 TrueY�6g   $��23��6x   $��5,79,0,0q�6�   $��1��6�   $	��Top=�6�   $	��146��6�   $��2��6�   6�   	� 5]   
   -   5        $'��!Выключить фильтры��5]      $ turOnFilters��63   $
��Left=�6M   $
 TrueY�6h   $��23��6y   $��5,56,0,0q�6�   $��1��6�   $	��Top=�6�   $	��146��6�   6�   �� 5^   
   $
��Left=�6   $��	0,159,0,0q�6/   $��2��6B   $	��Top=�6O   $	��117��6g   
�������#!Максимальная цена6�   �� 5_   
   $
��Left=�6   $��0,98,0,0q�6/   $��2��6A   $	��Top=�6N   $	��117��6f   
�������!Минимальная цена6�   	� 5`   
   $��Ожерелья��6   $ JewelryGroup��6)   $
��Left=�6B   $��23��6]   $��	10,16,0,0q�6i   $��3��6|   $	��Top=�6�   $	��107��6�   	� 5a   
   $��Кольца��6   $ JewelryGroup��6(   $
��Left=�6B   $��23��6]   $��	10,44,0,0q�6i   $��3��6|   $	��Top=�6�   $	��107��6�   	� 5b   
   $��Серьги��6   $ JewelryGroup��6(   $
��Left=�6B   $��23��6]   $��	10,72,0,0q�6i   $��3��6|   $	��Top=�6�   $	��107��6�   	� 5c   
   $��Браслеты��6   $ JewelryGroup��6)   $
��Left=�6C   $��23��6^   $��
10,100,0,0q�6j   $��3��6~   $	��Top=�6�   $	��107��6�   5d      5e      