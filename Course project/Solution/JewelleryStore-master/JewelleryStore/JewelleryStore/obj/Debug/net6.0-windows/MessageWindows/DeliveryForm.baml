   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:JewelleryStore.MessageWindowsJewelleryStore.MessageWindows  5   	   0    *JewelleryStore.MessageWindows.DeliveryForm   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   7local+clr-namespace:JewelleryStore.MessageWindows  5   	     � Title$  DeliveryForm��5	   	   $	��552��5
   	   $	��400��5   	    � 
ResizeMode$ NoResize=�5   	   $��Center=�5   	   $��Center=�5   	    � WindowStyle$
 None=�5   	    � AllowsTransparency$
 True��5   	   
������  � WindowStartupLocation$ CenterScreen=�5   	    � Cursor 5   	   �� *Cursor+.��5      � $��
0,0,0,-168q�6   .+�5   
   ��  �� CornerRadius$ 10��6   
�������   PrimaryHueLightBrush#���   5      $��2q�5      $��	0,0,0,178q�6%   �� 5   
   -   5         ��Name$
 City��5   ,   $�� ��6:     City)  #MaterialDesignThemes.Wpf.HintAssist   Hint# �  6B   $	��334��6z   $��36��6�   $��Center=�6�   $
��Left=�6�   	 �� Left$	 32��6�   

 �� Top$	
 177��6�   $
��Left=�6�   $	��Top=�6  $��	30,52,0,0q�6+   6   �� *Cursor+6+  �� 5   
   -   5         ! MaterialDesignFlatLightButton#��[ 5      $��340,10,10,678q�5      $
��Auto��6(   $	��✖��5      �� 5   
   -   5        $ Street��5   ,   $�� ��6<    
 Street# �  6D   $	��334��6~   $��36��6�   $��Center=�6�   $
��Left=�6�   $
��Left=�6�   $	��Top=�6�   $��
30,109,0,0q�6   6   �� *Cursor+6  �� 5   
   -   5        $ 	Apartment��5   ,   $�� ��6?     	Apartment# �  6G   $	��334��6�   $��36��6�   $��Center=�6�   $
��Left=�6�   $
��Left=�6�   $	��Top=�6�   $��
30,221,0,0q�6   6   �� *Cursor+6  �� 5    
   -   5        $ Entrance��5    ,   $�� ��6>     Entrance# �  6F   $	��334��6�   $��36��6�   $��Center=�6�   $
��Left=�6�   $
��Left=�6�   $	��Top=�6�   $��
30,278,0,0q�6   6   �� *Cursor+6  �� 5!   
   -   5        $ Floor��5!   ,   $�� ��6;    	 Floor# �  6C   $	��334��6|   $��36��6�   $��Center=�6�   $
��Left=�6�   $
��Left=�6�   $	��Top=�6�   $��
30,336,0,0q�6   6   �� *Cursor+6  �� 5"   
   -   5        $ Comment��5"      $	��334��6#   $	��105��6/    �� TextWrapping$
 Wrap=�6<   $��10��6P    % !MaterialDesignFloatingHintTextBox#��[ 5#        Comment# �  5%      $
��Left=�5&      $	��Top=�6,   $��
30,372,0,0q�6D   ��5$      �� *DescriptionEn+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5&   D   �� 5'   
   -   5         ��Name$ editUserLabel��5'       	 DeliveryForm#��� 	 6'   $��15(�6P   $��10,10,283,678q�6^   $
��Bold"�6u   #���   6�   �� 5)   
   -	   5        $ 	CityError��5)   $   $y�Hidden=�6    
 	CityError#��� 
 67   
���  ��$
��Left=�6n   $��10(�6�   $��	30,88,0,0q�6�   $	��Top=�6�   $	��334��6�   $��21��6�   �� 5*   
   -
   5        $ House��5*   ,   $�� ��6;    	 House# �  6C   $	��334��6|   $��36��6�   $��Center=�6�   $
��Left=�6�   $
��Left=�6�   $	��Top=�6�   $��
30,164,0,0q�6   6   �� *Cursor+6  �� 5+   
   -   5        $ StreetError��5+   $   $y�Hidden=�6     StreetError#���  69   
���  ��$
��Left=�6r   $��10(�6�   $��
30,145,0,0q�6�   $	��Top=�6�   $	��334��6�   $��21��6�   �� 5,   
   -   5          MaterialDesignRaisedButton#��[ 5,      $��30��5-   	   
�������$
��Bold"�5/   	    
 Finish#���  50   	   $��30,495,36,195q�6,   51   	   �� 52   
   -   5        $ 
FloorError��52   $   $y�Hidden=�6     
FloorError#���  68   
���  ��$
��Left=�6p   $��10(�6�   $��
30,372,0,0q�6�   $	��Top=�6�   $	��334��6�   $��21��6�   53      54      