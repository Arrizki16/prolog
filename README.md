# Tutorial Prolog with Linux

Some term that you have to know before learning prolog
* [**Knowledge Base**](#knowledge-base)
* [**Facts, rules, and queries**](#facts-rules-and-queries)
* [**Forward chaining and backward chaining**](#forward-chaining-and-backward-chaining)


### **Knowledge Base**
### **Facts, rules, and queries**  

### **Forward chaining and backward chaining**

1. Install swi-prolog
```
sudo add-apt-repository ppa:swi-prolog/stable
sudo apt-get install swi-prolog
```
2. Running swi-prolog
```
(without program)
swipl
(with program)
swipl -s program_name.pl
```
3. Hello world
```
write('hello world').
```
4. Logical tables  
![Untitled](https://user-images.githubusercontent.com/55046884/121104945-487a7300-c82d-11eb-870d-b2296aef16a2.png)  

5. Quantifiers  
Universal quantification (∀X)  
Existential quantification (ƎX)  

6. Exit program
```
halt.
```
**Tips**  
If you want to see all grandchild just add ; in the last  
