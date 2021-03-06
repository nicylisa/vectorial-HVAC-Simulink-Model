# Introduction of Vectorial HVAC Simulink Model

The model framework is shown as follows, 

<img src=".\images\model.png" style="zoom:40%;" />

1. Physical model. In this part, we build the temperature and humidity dynamics which are influenced by outside environment , human, radiators and air conditioning. 

2. Controller. To control vectorial signal, so we use Switch block rather than StateFlow to implement the control logic. User can change this module with ML component as demand.

3. Environment. It is worth noting that Environment is the stochastic part of the entire model including the outdoor environment and people influence on temperature which the number of people is parameterized. Weather datas are    extrapolated to fit our need from the dataset https://www.kaggle.com/selfishgene/historical-hourly-weather-data.  
4. Evaluations. This part is for verification about HVAC system. 

There are all the model setting files and model files in HVAC model folder.

There are two folders for the two experiments based on HVAC model.

The model with different online monitors  is the same in both folder, with the exception of the verification module that changes based on the experiment at hand.

- "fulltest.m" files are the launching scripts
- the "*.slx" files are the simulink models"
- the other files are for loading or defining the parameters.
   ## Model parameters and Ordinary Differential Equations

###### physical identification

| Symbol |  Reference  |     Symbol | Reference        |
| ------ | :---------: | ---------: | ---------------- |
| $b$    |   boiler    |       $rd$ | radiator         |
| $wt$   |    water    |        $w$ | wall             |
| $a$    |     air     |       $ac$ | air conditioning |
| $r$    | room number |        $o$ | outdoor          |
| $m$    | mixer room  | $$ init $$ | initial value    |

###### List of variables, inputs and constants

| Symbol     | Quantity                                                     |
| ---------- | ------------------------------------------------------------ |
| $\tau_{b}$ | Thermal Time Constant ($s$)                                  |
| $k_{b}$    | Thermal conductivity for a carbon steel boiler($J/(s*m*K)$ or $W/(m*K)$ ） |
| $th_{b}$   | boiler thickness ($m$)                                       |
| $A_i$      | area of i ($m^2$)                                            |
| $V_i$      | volume of i ($m^3$)                                          |
| $W_i$      | weight of water in i ($kg$)                                  |
| $C_i$      | heat capacity ($J/(kg*K)$)                                   |
| $ar$       | air mix ratio                                                |
| $k_w$      | wall thermal conductivity                                    |
| $th_{w}$   | wall thickness ($m$)                                         |
| $m_a$      | The mass of the air in 1Kg for each room                     |
| $m_w$      | The mass of the water in 1Kg for each room                   |
| $wf$       | water flow                                                   |
| $J$        | heat generated by human one hour                             |
| $T_i$      | temperature of i                                             |
| $PN_i$     | people number in room                                        |
| $Q_i$      | heat of i                                                    |

###### Ordinary Differential Equations 

| Component                  | ODE                                                          |
| -------------------------- | ------------------------------------------------------------ |
| Boiler                     | <img src="https://latex.codecogs.com/gif.latex?d{T_b}(t)&space;=&space;\left\{&space;\begin{array}{l}&space;\frac{{{T_{ini{t_b}}}(t)&space;-&space;{T_b}(t)}}{{{\tau&space;_b}}}dt,on\\&space;\frac{{&space;-&space;1&space;\cdot&space;({T_b}(t)&space;-&space;{T_r}(t))&space;\cdot&space;{k_b}&space;\cdot&space;t{h_b}&space;\cdot&space;{A_b}}}{{{W_b}&space;\cdot&space;{C_{wt}}}}dt,off&space;\end{array}&space;\right." title="d{T_b}(t) = \left\{ \begin{array}{l} \frac{{{T_{ini{t_b}}}(t) - {T_b}(t)}}{{{\tau _b}}}dt,on\\ \frac{{ - 1 \cdot ({T_b}(t) - {T_r}(t)) \cdot {k_b} \cdot t{h_b} \cdot {A_b}}}{{{W_b} \cdot {C_{wt}}}}dt,off \end{array} \right." /> |
| Air Mixer                  | $T_{m}(t) = ar \cdot T_{o}(t) + (1-ar) \cdot T_r(t) $        |
| Radiator                   | <img src="https://latex.codecogs.com/gif.latex?d{T_{rd}}(t)&space;=&space;\left\{&space;\begin{array}{l}&space;\frac{{wf&space;-&space;{T_b}(t)}}{{{V_{rd}}}}&space;&plus;&space;((1&space;-&space;\frac{{wf}}{{{V_{rd}}}})&space;\cdot&space;{T_{rd}}(t)&space;&plus;&space;\frac{{({T_{rd}}(t)&space;-&space;{T_r}(t))&space;\cdot&space;{k_{rd}}&space;\cdot&space;{A_{rd}}}}{{t{h_{rd}}&space;\cdot&space;{C_w}&space;\cdot&space;{m_w}}})&space;-&space;{T_{rd}}(t)dt,on\\&space;\frac{{({T_{rd}}(t)&space;-&space;{T_r}(t))&space;\cdot&space;{k_{rd}}&space;\cdot&space;{A_{rd}}}}{{t{h_{rd}}&space;\cdot&space;{C_{wt}}&space;\cdot&space;{m_{wt}}}}dt,off&space;\end{array}&space;\right." title="d{T_{rd}}(t) = \left\{ \begin{array}{l} \frac{{wf - {T_b}(t)}}{{{V_{rd}}}} + ((1 - \frac{{wf}}{{{V_{rd}}}}) \cdot {T_{rd}}(t) + \frac{{({T_{rd}}(t) - {T_r}(t)) \cdot {k_{rd}} \cdot {A_{rd}}}}{{t{h_{rd}} \cdot {C_w} \cdot {m_w}}}) - {T_{rd}}(t)dt,on\\ \frac{{({T_{rd}}(t) - {T_r}(t)) \cdot {k_{rd}} \cdot {A_{rd}}}}{{t{h_{rd}} \cdot {C_{wt}} \cdot {m_{wt}}}}dt,off \end{array} \right." /> |
| Heat Generate by Human     |$Q_{p} = \dfrac{PN_{r} \cdot J} { m_a \cdot C_{a}} $  |
| Exchange Heat              | $Q_{ex} = \dfrac{(A_w \cdot T_{r}(t) \cdot k_w)+((T_{o}(t)-T_{r}(t) \cdot A_w \cdot k_w)}{th_w \cdot m_a \cdot C_{a}}$ |
| Heat Generated by Radiator | $Q_{rd} = \dfrac{(T_{rd}(t)-T_{r}(t))\cdot k_{rd} \cdot A_{rd}}{C_{a} \cdot m_a} $ |
| Heat Generated by Boiler   | $Q_{b} = \dfrac{(T_{b}(t)-T_{r}(t))\cdot k_{b} \cdot A_{b}}{C_a \cdot m_a \cdot th_b} $ |
| Room Temperature           | <img src="https://latex.codecogs.com/gif.latex?dT_{r}&space;=&space;(Q_{ex}&plus;Q_{rd}&space;&plus;&space;Q_p&plus;&space;Q_b&space;&plus;T_{r}(t))&space;\cdot&space;(1-\dfrac{m_{ac}&plus;m_{mx}}{V_r})&space;&plus;&space;m_{ac}&plus;m_{mx}&space;\cdot&space;T_{ac}(t)&space;\\&plus;&space;\dfrac{m_{mx}&space;\cdot&space;T_{mx}(t)}{V_{r}}&space;-&space;T_{r}" title="dT_{r} = (Q_{ex}+Q_{rd} + Q_p+ Q_b +T_{r}(t)) \cdot (1-\dfrac{m_{ac}+m_{mx}}{V_r}) + m_{ac}+m_{mx} \cdot T_{ac}(t) \\+ \dfrac{m_{mx} \cdot T_{mx}(t)}{V_{r}} - T_{r}" /> |
| Relative Humidity          | <img src="https://latex.codecogs.com/gif.latex?H(t)&space;=&space;\left\{&space;\begin{array}{l}&space;(1&space;-&space;\frac{{{m_{mx}}}}{{{V_r}}})&space;\cdot&space;H(t)&space;&plus;&space;\frac{{{m_{mx}}}}{{{V_r}}}&space;\cdot&space;{H_o},aircon.off\\&space;\frac{{{m_{mx}}&space;\cdot&space;{H_o}&space;&plus;&space;{m_{ac}}&space;\cdot&space;{H_{ac}}}}{{{V_r}}}&space;&plus;&space;(1&space;-&space;\frac{{{m_{ac}}&space;&plus;&space;{m_{mx}}}}{{{V_r}}})&space;\cdot&space;H(t),aircon.on&space;\end{array}&space;\right." title="H(t) = \left\{ \begin{array}{l} (1 - \frac{{{m_{mx}}}}{{{V_r}}}) \cdot H(t) + \frac{{{m_{mx}}}}{{{V_r}}} \cdot {H_o},aircon.off\\ \frac{{{m_{mx}} \cdot {H_o} + {m_{ac}} \cdot {H_{ac}}}}{{{V_r}}} + (1 - \frac{{{m_{ac}} + {m_{mx}}}}{{{V_r}}}) \cdot H(t),aircon.on \end{array} \right." /> |




