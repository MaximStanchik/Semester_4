   M S B A M L   `   `   `  ����@  <Lab07, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab07Lab07  5      clr-namespace:Lab07Lab07  5      clr-namespace:Lab07Lab07  5	          Lab07.ProductsPage   5      W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      localclr-namespace:Lab07  5      wclr-namespace:Lab07  5      "controlsclr-namespace:Lab07  5	        N� Title$  ProductsPage��5       � 	Resources 5       �� Source�� 5   
   $ Resources/Styles.xaml?�6   %     J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ w:Command.AddCommand��5      6P     5   
   -   5        $ w:Command.UpdateCommand��5      6S     5   
   -   5        $ w:Command.DeleteCommand��5      6V     5   
   -   5        $ w:Command.UndoCommand��5      6K     5   
   -   5        $ w:Command.RedoCommand��5      6K   .��5      � 
������� � RowDefinitions 5   
   �� 5      $	��68* �6   �� 5      $	��71* �6   �� 5      $
��213* �6   �� 5      $
��140* �6   �� 5      $	��31* �6    � ColumnDefinitions 5!   
   �� 5"      $
��527* �6   �� 5#      $
��207* �6   .+�5&   
      Lab07.MessageControl  -   5          Name$ message��5&   "    K� ZIndex$ 7��63      Success	   TextMessage#	 �   6D   $��2��6l   $��
200,0,70,0q�6y   $	��250��6�   !   Lab07.MessageControlConfirm  5'   
   -   5        
  Name$
 messageConfirm��5'   )      Value$ Admin��6A   $ 7��6O   $��2��6`   $��
200,0,70,0q�6m   $	��250��6�   �� 5(   
   $
��Left=�6   $��0��6,   $��0��6<   $��w:Command.AddCommand��6I     
DarkButton#���  5)        Add#���  5*      
�������$��40��5+   (   $��24,7,0,2q�5,       � Cursor$  ��6'   $	��101��61   �� 5.   
   -   5         ��Name$ editBtn��5.      $
��Left=�6"   $��w:Command.UpdateCommand��6=   $��0��5/      $��0��6!   $	��100��6.   $��	150,7,0,2q�50        	MidButton#���  51        Edit#���  52      ${�False��53      $��40��6#   $  ��6/   �� 55   
   -	   5        $ 	deleteBtn��55   ,   $
��Left=�6   $��w:Command.DeleteCommand��56      $��0��57      $��0��6"   $��	276,6,0,3q�6/   #���  58       
 Delete#���  59      $	��100��5:      ${�False��5;      $��40��5<      $  ��6   �� 5>   
   -
   5         ��Name$ SearchField��5?      $��0��5>      $��1��6    % !MaterialDesignFloatingHintTextBox#��[ 5@      $	��Top=�5A      .  (MaterialDesignThemes.Wpf.TextFieldAssist   HasClearButton$
 True��5B      $��
0,5,10.2,0q�6G   $��42��6[   .��6h   )  #MaterialDesignThemes.Wpf.HintAssist   Hint 5D      �� 5F       �� Orientation$ 
Horizontal=�6   $��-2 0 0 0q�68   .+�5G      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Search=�64   �� 5H       
 Search#���  6    5I      .��5K   .   5L      �� 5O   
   -   5         ��Name$ scrollBarViewer��5O      $��10q�60   $��0��6<   $��2��6L   $��1��6`   $��4��6m   .��5P      � -   5         �Name$ products��5P      5Q      �� 5R   
   $��w:Command.UndoCommand��6   #���  61   $
��Left=�6V   $��
392,11,0,6q�6q    J� RenderTransformOrigin$ 0.266,-0.181&�6�   $��0��6�   $��40��6�   $��32��6�   .��5S        $
 Undo=�6&   64   5T      �� 5U   
   $��w:Command.RedoCommand��6   #���  61   $
��Left=�6V   $��
448,11,0,6q�6q   $ 0.266,-0.181&�6�   $��0��6�   $��40��6�   $��32��6�   .��5V        $
 Redo=�6&   64   5W      5X      5Y      