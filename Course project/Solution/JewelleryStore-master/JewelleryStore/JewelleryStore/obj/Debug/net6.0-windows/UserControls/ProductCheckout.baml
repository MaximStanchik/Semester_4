   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5      $    JewelleryStore.ProductCheckout   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      .localclr-namespace:JewelleryStore     5      _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        � Cursor  5      �� *Cursor+ � DataContext 5	      �� .��5      � 
�������$��3,3,3,3q�6   +  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth4=�6/    � ColumnDefinitions 5   
   �� 5      $	��92* �6   �� 5      $
��111* �6   �� 5      $
��171* �6   �� 5      $	��86* �6   �� 5      $	��37* �6   .+�5   
   �� -   5         ��Name$ productPhoto��5      $��0,3,0,0q�6G   $��88��6X   $	��Top=�6d   ��6'   �� *ProductPhoto+6d   �� 5   
   -   5         ��Name$ productName��5   K   $��WrapWithOverflow=�6    �� TextAlignment$ Center=�64   $��1��6`   $��Center=�6�   $��67��6�   $��
10,24,10,3q�6�   ��6p   �� *ProductName+6�   �� 5   
   -   5         ��Name$ removeOneBtn��5      $��2��6L   $��-��6\   $
��Auto��6i   $��17,30,158,32q�6w   ��6'   �� *RemoveOneCommand+6w   �� 5   
   -   5        $ 	addOneBtn��5      $��2��6F   $��+��6V   $
��Auto��6c   $��157,30,16,32q�6q    J� RenderTransformOrigin$ 0.5,0.5&�6�   ��6$   �� *AddOneCommand+z�5      V� 5      .~�5      �� 	 �� ScaleX$	 -1Q�6%   �� 5      �� 5      T� 5      5      5!      �� 5"   
   -   5        
 ��Name$
 quantityLabel��5"      $��2��6'   $��Center=�6T   $��Center=�6o   $��Center=�6�   $��	80,0,80,0q�6�   $��30��6�   ��67   �� *
Quantity+6�   �� 5#   
   -   5        $
 price��5#      $��3��6   $��Center=�6I   $��Center=�6d   $��DemiBold"�6�   $��29��6�   $��	2,33,0,32q�6�   $��84��6�   $ 0.542,0.833&�6�   ��6/   �� *Price+6�   �� 5$   
   -   5        $ 
removeItem��5$      $��4��5&      $��Center=�5'      $��26��5(      $��Center=�5)      $��26��5*       &  "MaterialDesignIconForegroundButton#���   5+      ���#E2EEED��5$   %   �� *RemoveItemCommand+.��5-      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�5.      5/      �� 52   
   $��5��6   $��0��6(   ���#F8E2E7$��Bottom=�6J   $ Depth5=�6f   $��1��6�   $��0q�6�   53      54      