   M S B A M L   `   `   `  ����I  EJewelleryStore, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null/clr-namespace:JewelleryStoreJewelleryStore  5   	       JewelleryStore.Login   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   _ [MaterialDesignThemes.Wpf, Version=4.8.0.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   :d2http://schemas.microsoft.com/expression/blend/2008  5   	   Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5   	   (localclr-namespace:JewelleryStore  5   	   _ [Microsoft.Xaml.Behaviors, Version=1.1.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a3i+http://schemas.microsoft.com/xaml/behaviors  5   	     � Title$  Login��5
   	   $	��600��5   	   $	��323��5   	    � 
ResizeMode$ NoResize=�5   	    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�5   	    � Cursor 5      �� *Cursor+ � 	Resources 5      (   "JewelleryStore.VisibilityConverter   BTVConverter��%   &	          5   
   6$   5      .��5      � $��0,0,-9,0q�6   .+�5   
   �� .+�5      �� $	��323��6   $	��600��6$   
�������+  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth4=�6X      ShadowEdges$ Right=�6�   $
��Left=�6�   $��Center=�6�    61   �� *Cursor+6�   �� 5      -   5         ��Name$ username��5   0     Username)  #MaterialDesignThemes.Wpf.HintAssist	   Hint#	 �  6\   $	��260��6�   $��36��6�   $��Center=�6�   $
��Left=�6�   
 �� Left$
 32��6�   
 �� Top$	 177��6  $��Center=�6  $	��Top=�63   6   �� *Cursor+��6B   �� *
Username+63  G� 5      -   5         G�Name$ password��5   4     Password#	 �  6F   $	��260��6�   $��30��6�   $��Center=�6�   $
��Left=�6�   $
 32��6�   $	 270��6�   $��Center=�6   $��Center=�6   6   �� *Cursor+*  $Microsoft.Xaml.Behaviors.Interaction   	Behaviors 5      %   JewelleryStore.PasswordBehavior  5         Password 6-   �� *
Password+ �� Mode$ TwoWay=� �� UpdateSourceTrigger$ PropertyChanged=�5      �� 5      -   5         ��Name$ loginBtn��5   �     MaterialDesignRaisedButton#��[ 6P   $	��125��6�   $��38��6�   
�������$
��Bold"�6�   $
 32��6�   $	 371��6�    	 Login#���  6�   $��Center=�6  $	��Top=�64   6   �� *Cursor+��6/   �� *LoginCommand+64  �� 5       -   5         ! MaterialDesignFlatLightButton#��[ 5    /   $
��Auto��6f   $��1��6t   $
��Left=�6�   $	
 263��6�   $ 10��6�   $��Center=�6�   .��5!      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5"      �� 5#      $��/images/logotype.png��6   $��90��62   $	��260��6>   $
 32��6J   $ 70��6[   $��Center=�6k   $	��Top=�6�   �� 5$      $	
 176��6S   $	 480��6e     AdminButton#��[ 6v     Register#���  6�    �� TextAlignment$ Center=�6�   $��Center=�6�   $��Center=�6  $��20��6'  $	��116��63   J� RenderTransformOrigin$ 
0.724,0.87&�6?  $
��Left=�6b  $��Center=�6}  ��6   �� *RegisterCommand+ 69   �� *Cursor+6}  d� 5%       $  MaterialDesignActionToggleButton#��[ 6   $��RU��6U   $��11(�6b   $��Center=�6p   $	��Top=�6�   1  +MaterialDesignThemes.Wpf.ToggleButtonAssist   	OnContent$ EN��6$  $
 22��6U  $	 537��6f  $��30��6w  $��30��6�  $ Depth2=�6�  .  (MaterialDesignThemes.Wpf.ColorZoneAssist   
Background
 �����$
��Left=�6�   d� 	IsChecked 6�   �� *	LangCheck+$ TwoWay=�$ PropertyChanged=���6�   �� *SwitchLangCommand+6�  �� 5&      -   5         ��Name$ errorMessage��5&       	 ErrorMessage#��� 	 6*   $
 83��6S   $	 320��6d   $	��166��6u   
���  ��$��Center=�6�   $	��Top=�6  $��Center=�6  y�6�   �� *ErrorMessage+ �� 	Converter# [  6  �� 5'      $	
 168��68   $	 376��6J    
 MaterialDesignFlatButton#��[
 6u   $��12(�6�     
ForgotPass#���  6�   $ Center=�6�   $��Center=�6�   $��Center=�6!  $��28��6C  $	��124��6O  $ 
0.707,0.47&�6[  $
��Left=�6~  $��Center=�6�  ��6   �� *RecoverCommand+ 6[   �� *Cursor+6�  �� 5(      $/��)У вас еще нет аккаунта?��6   $
 32��67   $	 479��6H   $��Center=�6Y   $��Center=�6v   
�������$	��147��6�   5)      5*      5+      