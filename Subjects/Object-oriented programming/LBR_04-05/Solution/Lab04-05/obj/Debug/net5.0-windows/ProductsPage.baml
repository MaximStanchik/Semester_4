   M S B A M L   `   `   `  ����C  ?Lab04-05, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Lab04_05Lab04_05  5      #clr-namespace:Lab04_05Lab04_05  5          Lab04_05.ProductsPage   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      "localclr-namespace:Lab04_05  5      wclr-namespace:Lab04_05  5        N� Title$  ProductsPage��5       � 	Resources 5       �� Source�� 5   
   $ Resources/Styles.xaml?�6   %     J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ w:Command.AddCommand��5      6P     5   
   -   5        $ w:Command.UpdateCommand��5      6S     5   
   -   5        $ w:Command.DeleteCommand��5      6V   .��5      � 
������� � RowDefinitions 5   
   �� 5      $	��68* �6   �� 5      $	��71* �6   �� 5      $
��213* �6   �� 5      $
��140* �6   �� 5      $	��31* �6    � ColumnDefinitions 5   
   �� 5      $
��527* �6   �� 5       $
��207* �6   .+�5%   
   �� $
��Left=�6   $��0��6,   $��0��6<   $��w:Command.AddCommand��6I      
DarkButton#��[  5&        Add#���  5'      
�������$��40��5(   (   $��24,7,0,2q�5)       � Cursor$  ��6'   $	��101��61   �� 5+   
   -   5         ��Name$ editBtn��5+      $
��Left=�6"   $��w:Command.UpdateCommand��6=   $��0��5,      $��0��6!   $	��100��6.   $��	179,6,0,3q�5-        	MidButton#��[ 5.        Edit#���  5/      ${�False��50      $��40��6#   $  ��6/   �� 52   
   -   5        $ 	deleteBtn��52   ,   $
��Left=�6   $��w:Command.DeleteCommand��53      $��0��54      $��0��6"   $��	340,5,0,4q�6/   #��[ 55       
 Delete#���  56      $	��100��57      ${�False��58      $��40��59      $  ��6   �� 5;   
   -   5        	 ��Name$	 SearchField��5<      $��0��5;      $��1��6    % !MaterialDesignFloatingHintTextBox#��[ 5=      $	��Top=�5>      .  (MaterialDesignThemes.Wpf.TextFieldAssist
   HasClearButton$

 True��5?      $��
0,5,10.2,0q�6G   $��42��6[   .��6�   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5A      �� 5C       �� Orientation$ 
Horizontal=�6   $��-2 0 0 0q�68   .+�5D      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�64   �� 5E       
 Search#���  6    5F      .��5H   .   5I      �� 5L   
   -   5         ��Name$ scrollBarViewer��5L      $��10q�60   $��0��6<   $��2��6L   $��1��6`   $��4��6m   .��5M      � -   5         �Name$ products��5M      5N      5O      5P      