There is all the model setting files and model file in HVACmodel folder.

There are two folders for the two experiments based on HVAC model.
Based on the work of Cauchi and Abate,this work follows model frame work and themromal dynamics improved the model to make it scalable. Ordinary differitial equations list as follows:

|Symbol | Reference  | Symbol | Reference|
|- | :-: | -: |
|b | bolier |rd  | radiator|
|wt | water |w|  wall|
|a| air |ac| air conditionning|
|r |room number|o | outdoor|
|m | mixer room |
|init | initial value | PN |people number in room | 
	

\begin{table}
	\centering
	\caption{List of variables, inputs and constants}
	\resizebox{\textwidth}{!}{
	\begin{tabular}{ c | c | c } 
		\hline
		Symbol & Quantity & value \\ \hline
		$\tau_{b}$ & Thermal Time Constant (s) & \\ \hline
		$k_{b}$ & Thermal conductivity for a carbon steel boiler ($J/(s*m*K)$ or $W/(m*K)$)  & \\ \hline
		$th_{b}$ & boiler thickness ($m$) &   \\ \hline
		$A_i$ & area of i ($m^2$) & \\ \hline
		$V_i$ & volume of i ($m^3$)&  \\ \hline
		$W_i$ & weight of water in i (kg) & \\ \hline
		$C_i$ & heat capacity (J/(kg*K))\\ \hline
		$ar$   & air mix ratio\\ \hline
		$k_w$ & wall thermal conductivity\\ \hline
		$th_{w}$ & wall thickness ($m$) &   \\ \hline
		$m_a$ & The mass of the air in 1Kg for each room \\ \hline
		$m_w$ & The mass of the water in 1Kg for each room \\ \hline
		$wf$ & water flow\\ \hline
		$T_i$ & temperature of i \\ \hline
		$J$  & heat generated by human one hour\\
		\hline
		$PN_i$  &people number in room \\ \hline
		$Q_i$  &heat of i \\ \hline
	\end{tabular}
     }
\end{table}


\begin{table}
	\centering
	\caption{ODE}
	\resizebox{\textwidth}{!}{
	\begin{tabular}{ c | c } 
		\hline
		Component & ODE  \\ \hline
		Boiler & 
		\([d{T_b}(t) = \left\{ \begin{array}{l}
		\frac{{{T_{ini{t_b}}}(t) - {T_b}(t)}}{{{\tau _b}}}dt,on\\
		\frac{{ - 1 \cdot ({T_b}(t) - {T_r}(t)) \cdot {k_b} \cdot t{h_b} \cdot {A_b}}}{{{W_b} \cdot {C_{wt}}}}dt,off
		\end{array} \right.\) \\ \hline
		
		
		Air Mixer & $T_{m}(t) = ar \cdot T_{o}(t) + (1-ar) \cdot T_r(t) $ \\ \hline
         	
         Radiator &
		\(d{T_{rd}}(t) = \left\{ \begin{array}{l}
		\frac{{wf - {T_b}(t)}}{{{V_{rd}}}} + ((1 - \frac{{wf}}{{{V_{rd}}}}) \cdot {T_{rd}}(t) + \frac{{({T_{rd}}(t) - {T_r}(t)) \cdot {k_{rd}} \cdot {A_{rd}}}}{{t{h_{rd}} \cdot {C_w} \cdot {m_w}}}) - {T_{rd}}(t)dt,on\\
		\frac{{({T_{rd}}(t) - {T_r}(t)) \cdot {k_{rd}} \cdot {A_{rd}}}}{{t{h_{rd}} \cdot {C_{wt}} \cdot {m_{wt}}}}dt,off
		\end{array} \right.\) \\ \hline
		
		Heat Generate by Human & $Q_{p} = \dfrac{PN_{r} \cdot J} { m_a \cdot C_{a}} $  \\ \hline
		
		Exchange Heat & $Q_{ex} = \dfrac{(A_w \cdot T_{r}(t) \cdot k_w)+((T_{o}(t)-T_{r}(t) \cdot A_w \cdot k_w)}{th_w \cdot m_a \cdot C_{a}}$  \\ \hline
		
		Heat Generated by Radiator & $Q_{rd} = \dfrac{(T_{rd}(t)-T_{r}(t))\cdot k_{rd} \cdot A_{rd}}{C_{a} \cdot m_a} $ \\ \hline
		
		Heat Generated by Boiler & $Q_{b} = \dfrac{(T_{b}(t)-T_{r}(t))\cdot k_{b} \cdot A_{b}}{C_a \cdot m_a \cdot th_b} $   \\ \hline
		
		Room Temperature & $dT_{r} = (Q_{ex}+Q_{rd} + Q_p+ Q_b +T_{r}(t)) \cdot (1-\dfrac{m_{ac}+m_{mx}}{V_r}) + m_{ac}+m_{mx} \cdot T_{ac}(t) + \dfrac{m_{mx} \cdot T_{mx}(t)}{V_{r}} - T_{r}$ \\ 
		\hline
		
		Relative Humidity & 
		\(H(t) = \left\{ \begin{array}{l}
		(1 - \frac{{{m_{mx}}}}{{{V_r}}}) \cdot H(t) + \frac{{{m_{mx}}}}{{{V_r}}} \cdot {H_o},aircon.off\\
		\frac{{{m_{mx}} \cdot {H_o} + {m_{ac}} \cdot {H_{ac}}}}{{{V_r}}} + (1 - \frac{{{m_{ac}} + {m_{mx}}}}{{{V_r}}}) \cdot H(t),aircon.on
		\end{array} \right.\) \\ \hline
    \end{tabular} 
}
\end{table}


%margin is when it's over the verify time gonna stop, when the value less than  the setting value gonna stop
%\subsection{nested Operator transformation}



%) as the number of
%samples we need to consider in the future. In MTL, the satisfaction of the formuladepends on what will happen in the future.





The model is the same in both folder, with the exception of the verification module that changes based on the experiment at hand.

- "fulltest.m" files are the launching scripts
- the "*.slx" files are the simulink models"
- the other files are for loading or defining the parameters.
