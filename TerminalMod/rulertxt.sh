#!/bin/bash

printf 'Para Adicionar efeito a um texto usando printf usa-se: (\e[{ef1};{ef2};{efn..}m)"texto\n"'
printf 'O ultimo efeito sempre terá prioridade do que seu anterior e se provocarem o mesmo tipo de mudança, não podendo se mesclar, um sobrepoe o outro\n'
printf 'Ao adicionar mais de um efeito, se utiliza ";", e ao terminar as seleções, utiliza-se "m" para poder inserir o texto que será editado\n'
printf 'O efeito só se aplicará no texto que sucede o código de edição, não seu predecessor, e o efeito se extende ate outro sinal de edição ser lançado que sobreponha ele\n'

printf  "\n\e[1;5;4;53m| TABELA DE LETRAS & FUNDOS ESCUROS |\e[m\n"

echo

for ((fg_clr = 30; fg_clr < 38; fg_clr ++)); do
	for ((bold = 0; bold <= 1; bold ++)); do
		for ((bg_clr = 40; bg_clr < 48; bg_clr ++)); do
				if [[ ${bold} == 0 ]]; then 
					printf "\e[${bg_clr};${fg_clr}m ${bg_clr};${fg_clr}   \e[m"
				else
					printf "\e[${bg_clr};${fg_clr};${bold}m ${bg_clr};${fg_clr};${bold} \e[m"
				fi
		done
		echo
	done
done

printf "\n\e[1;5;4;53m| TABELA DE LETRAS & FUNDOS CLAROS |\e[m\n"

echo

for ((fg_clr = 90; fg_clr < 98; fg_clr ++)); do
	for ((bold = 0; bold <= 1; bold ++)); do
		for ((bg_clr = 100; bg_clr < 108; bg_clr ++)); do
				if [[ ${bold} == 0 ]]; then 
					printf "\e[${bg_clr};${fg_clr}m ${bg_clr};${fg_clr}   \e[m"
				else
					printf "\e[${bg_clr};${fg_clr};${bold}m ${bg_clr};${fg_clr};${bold} \e[m"
				fi
		done
		echo
	done
done

printf "\n\e[1;5;4;53m| TABELA DE CORES DE 8 BITS (255 CORES) |\e[m\n"

echo

for ((i = 1; i < 15 ; i=$((i + 8)))); do
	for ((count = ${i}; count < $((i + 8)); count ++)); do
		if [[ ${count} == 1 || ${count} > 16 ]]; then
			printf "\e[38;5;${count}m TESET(0${count}) \e[m"
		else
			printf "\e[38;5;${count}m TESET(${count}) \e[m"
		fi
	done
	echo
done

echo

for ((i = 16; i < ((16 + 36)); i++)); do
	for ((color = ${i}; color <= $((i + 180)); color=$((color + 36)))); do
		printf "\e[38;5;${color}mTESET(${color})\e[m"
	done
	echo
done

echo

for ((i = 232; i < 250; i=$((i + 8)))); do
	for ((count = ${i}; count < $((i + 8)); count ++)); do
		printf "\e[38;5;${count}mTESET(${count})\e[m"
	done
	echo
done

printf "\n\e[1;5;4;53m| EFEITOS DE TEXTO |\e[m\n"

echo

printf "00 => \e[00mNULL Efect \e[m<=\n"
printf "01 => \e[01mLight Letter \e[m<=\n"
printf "02 => \e[02mShadow Letter \e[m<=\n"
printf "03 => \e[03mItalic Letter \e[m<=\n"
printf "05 => \e[05mTwinkle Letter \e[m<=\n"
printf "04 => \e[04mUnderline Letter \e[m<=\n"
printf "21 => \e[21mDouble Underline Letter \e[m<=\n"
printf "09 => \e[09mSensured Letter \e[m<=\n"
printf "53 => \e[53mUpperline Letter \e[m<=\n"
printf "73 => \e[73mUp Align Letter \e[m<=\n"
printf "74 => \e[74mDown Allign Letter \e[m<=\n"
printf "07 => \e[07mSwitch Letter Color From Back Ground Letter Color \e[m<=\n"
printf "08 => \e[08mInvisible Letter \e[m<=\n"

echo -e	"\nCreated by: Thiago Firmino dos S. (thfirmin)\n"
