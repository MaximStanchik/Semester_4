   M S B A M L   `   `   `  ����@  <Lab08, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab08Lab08  5   	       Lab08.Planet   5   	   W SPresentationCore, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=5.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   %localclr-namespace:Lab08     5   	     � Title$  Планета��5      $	��530��6   $	��200��6%    � WindowStartupLocation$ CenterScreen=�61    � 
ResizeMode$ NoResize=�6V   ���	#FFC4C0FF.��5	      � .+�5
   
   ��  �� Orientation$ Vertical=�6   .+�5      �� $��Название:��6   $��Center=�6)   �� 5      -   5         ��Name$
 Name��5      $��
25,0,25,25q�6$   �� 5      $��Радиус:��6   $��Center=�6'   �� 5      -   5        $ Radius��5      $��
25,0,25,25q�6&   �� 5      $&�� Температура ядра:��6   $��Center=�61   �� 5      -   5        $
 Temp��5      $��
25,0,25,25q�6$   �� 5      $"��Есть атмосфера?��6   $��Center=�6/   �� 5      $ 
Horizontal=�6   $��Center=�62   $��25, 5, 25, 25q�6O   .+�5      	� -   5         	�Name$	 Atm��5       	� 	GroupName$ Have_Atm��6+   $
��Да��6@    d� 	IsChecked$
 TrueY�6M   $��0, 0, 25, 0q�6^   	� 5      $ Have_Atm��6   $��Нет��63   5      �� 5      $��Есть жизнь?��6   $��Center=�6+   �� 5      $ 
Horizontal=�6   $��Center=�62   $��25, 5, 25, 25q�6O   .+�5      	� -   5        $
 Life��5      $ 	Have_Life��6,   $
��Да��6B   $
 TrueY�6O   $��0, 0, 25, 0q�6`   	� 5      $ 	Have_Life��6   $��Нет��64   5      �� 5      -   5        $!��Загрузить фото��5   *   $��
25,0,25,25q�6C   $��20��6W   �� 5      -   5         ��Name$ 
imgDynamic��5      $	��100��6(   $	��100��65   �� 5      -   5        $��Сохранить��5      $��25,25,25,25q�6)   $��20��6T   5      5      5       