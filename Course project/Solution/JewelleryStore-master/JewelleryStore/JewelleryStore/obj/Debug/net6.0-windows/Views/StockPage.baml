   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:JewelleryStore.ViewsJewelleryStore.Views  5      $    JewelleryStore.Views.StockPage   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      4local"clr-namespace:JewelleryStore.Views     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      $	��663��5	      $	��600��6     N� Title$  Stock��5
       � Cursor 6   �� *Cursor+ � 	Resources 5       �� Source�� 5   
   $ /Resources/Styles.xaml?�6   %    .��5      � 
�������.+�5   
   �� -   5         ��Name$ SetTheDiscountAmount��5      $	��389��60   $��8��6<   $��47��5       %  !MaterialDesignFloatingHintTextBox#��[  5        DiscountInPercent)  #MaterialDesignThemes.Wpf.HintAssist   Hint# �  5      $��Center=�5      $	��Top=�6*   $��	0,119,0,0q�6B   ��5      �� *MetalSample+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5   B   �� 5   
   -   5         ��Name$ checkBoxNecklaces��5        	Necklaces#���  6.   $
��Left=�6T   $��43��6o   $��137,227,0,0q�6{   $	��Top=�6�   $	��144��6�   �� 5   
   	 �� 
IsReadOnly$
	 True��6   $��Center=�6$   $��29��6A   $��	0,192,0,0q�6M   
 �� TextWrapping$

 Wrap=�6`   $	��Top=�6t   $	��389��6�     TypesOfDishes#���  6�   �� 5   
   -   5        $ checkBoxRings��5       	 Rings#���  6*   $
��Left=�6L   $��47��6g   $��137,270,0,0q�6s   $	��Top=�6�   $	��144��6�   �� 5   
   -   5        $ checkBoxEarrings��5        Earrings#���  6-   $
��Left=�6R   $��47��6m   $��137,317,0,0q�6y   $	��Top=�6�   $	��144��6�   �� 5   
   -   5        $ checkBoxWristwear��5        	Wristwear#���  6.   $
��Left=�6T   $��48��6o   $��137,364,0,0q�6{   $	��Top=�6�   $	��144��6�   �� 5   
   -   5          MakeDiscount#���  5      $��	0,415,0,0q�6P   ���#fff  DefaultButtonStyle#���  6u   ���#0058A3$��10(�6�   $	��389��6�   $��30��6�   $	��Top=�6�   $��Center=�6�   �� 5   
   -   5         	 UpdateDiscount#��� 	 5      $��	0,464,0,0q�6V   ���#fff#���  6{   ���#0058A3$��10(�6�   $	��389��6�   $��31��6�   $	��Top=�6�   $��Center=�6�   5      5       