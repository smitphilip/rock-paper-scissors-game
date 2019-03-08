#!/bin/bash

CPUSCORE=0
PLAYERSCORE=0
function CHOOSEWEAPON () {
  case $1 in
    1) CPUWEAPON="ROCK" ;;
    2) CPUWEAPON="PAPER" ;;
    3) CPUWEAPON="SCISSORS" ;;
  esac
}

while true; do
  echo -e "Choose your weapon... 
  1) Rock
  2) Paper
  3) Scissors: "
  read x
  
  case $x in
    1) USERWEAPON="ROCK" ;;
    2) USERWEAPON="PAPER" ;;
    3) USERWEAPON="SCISSORS" ;;
    *) echo "Incorrect Choice" 
      continue;;
  esac

  CHOOSEWEAPON $((1 + RANDOM % 3))
  echo ""
  echo "USER=$USERWEAPON"
  echo "COMP=$CPUWEAPON"
  echo ""

  if [ "$USERWEAPON" = ROCK ]; then
    case $CPUWEAPON in
      ROCK) echo "DRAW" ;;
      PAPER) echo "I WIN!!"; CPUSCORE=$((CPUSCORE + 1)) ;;
      SCISSORS) echo "YOU WIN!!"; PLAYERSCORE=$((PLAYERSCORE + 1));;
    esac
  elif [ "$USERWEAPON" = PAPER ]; then
    case $CPUWEAPON in
      ROCK) echo "YOU WIN"; PLAYERSCORE=$((PLAYERSCORE + 1)) ;;
      PAPER) echo "DRAW" ;;
      SCISSORS) echo "I WIN!!"; CPUSCORE=$((CPUSCORE + 1)) ;;
    esac
  else
    case $CPUWEAPON in
      ROCK) echo "I WIN!!"; CPUSCORE=$((CPUSCORE + 1)) ;;
      PAPER) echo "YOU WIN!!"; PLAYERSCORE=$((PLAYERSCORE + 1)) ;;
      SCISSORS) echo "DRAW" ;;
    esac
  fi
  echo "
SCORE:
COMP=$CPUSCORE
USER=$PLAYERSCORE
"
done
