   M S B A M L   `   `   `  ����@  <Lab07, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab07Lab07  5   	   clr-namespace:Lab07Lab07  5	   	       Lab07.MainWindow   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   localclr-namespace:Lab07  5   	   wclr-namespace:Lab07  5	   	     � WindowStartupLocation$  CenterScreen=�5
   	    � Title$ Admin��5   	   $	��600��6   $	��900��6$    � 	Resources 5       �� Source�� 5   
   $ Resources/Styles.xaml?�6   %     J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$! w:Command.SwitchLangCommand��5      6W     5   
   -   5        $ w:Command.ShowCommand��5      6S     5   
   -   5        $! w:Command.ShowEventsCommand��5      6W   .��5      �    MaterialDesignPaper#���   6    � ColumnDefinitions 5   
   �� 5      $
��160* �6   �� 5      $
��527* �6   �� 5      $
��207* �6    � RowDefinitions 5   
   �� 5      $	��68* �6   �� 5      $	��71* �6   �� 5       $
��213* �6   �� 5!      $
��140* �6   �� 5"      $	��31* �6   .+�5&   
   �� $��0��6   $��6��6$    J� Opacity$	 0.3Q�65     	FillBrush#���  6C   +  %MaterialDesignThemes.Wpf.ShadowAssist	   ShadowDepth$	 Depth2=�5'      
   ShadowEdges$
 Right=�5(      �� 5+   
   -   5         ��Name$ ProductsBtn��5+      $��2��6&   $��w:Command.ShowCommand��5,        LightButton#���  5-        Products#���  5.       �� 	IsDefault$
 True��5/      $	��Top=�50      $��50��52      $��0,29,0,0q�6   �� 57   
   $��/images/logo.png��6   $��0��6*   $��10,11,10,10q�6:   $��1��6Q    J� RenderTransformOrigin$ 0.507,0.544&�6e   $��0��6�   �� 58   
   -   5         ��Name$ 	pageLabel��58      $��1��59      $��15(�6    $��10,10,435,10q�5:      $
��Bold"�5;      ���#36BEB3$��Center=�5<      $��28��6+   �� 5>   
   $��1��5?      $��Right=�6    �� Orientation$ 
Horizontal=�5@      $��4q�5A      .+�5B      	� -   5           MaterialDesignTabRadioButton#��[ 5C      $��4q�5D      
 � Tag$ Theme1��5E        Blue#���  5F       � Cursor$
 Hand��62   	� 5G      -   5        #��[ 5H      $��4q�5I      $ Theme2��5J       d� 	IsChecked$ FalseY�6     Red#���  5K      $
 Hand��61   5L       � 5O   
   -   5          �Name$ myFrame��5O   C   #���   6     � NavigationUIVisibility$ Hidden=�6T   $��0��6t   $��1��6�   $��4��6�   $��2��6�   5Q      �� 5T   
   $��0��5U      $��3��6   $ Vertical=�5V      .+�5W      	� -	   5        #���  5X      $��4q�5Y      $ Theme1��5Z      #���  5[      $
 Hand��62   	� 5\      -
   5        #���  5]      $��4q�5^      $ Theme2��5_      $ FalseY�6   #���  5`      $
 Hand��61   5a      d� 5c   
   -   5         d�Name$
 Lang��5c       $  MaterialDesignActionToggleButton#��[ 5d      $��RU��5e      $��11(�6    $��Center=�5f      $��Center=�5g      $!��w:Command.SwitchLangCommand��5h      1  +MaterialDesignThemes.Wpf.ToggleButtonAssist   	OnContent$ EN��5i       �� Left$	 291��6B   
 �� Top$	 321��6T   $��40��6e   $��40��6q   $	 Depth1=�5j      $	��Top=�6B   $��3��6Z   $��	0,100,0,0q�6g   5k      �� 5l   
   -   5        $ EventsButton��5l      $��2��6'   $!��w:Command.ShowEventsCommand��5m      #���  5n      $��Events��5o      $
 True��5p      $	��Top=�5q      $��50��5s      $��	0,105,0,0q�6   5u      5v      