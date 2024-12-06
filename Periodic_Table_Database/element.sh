#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

INPUT=$(echo $1)

PRINT_RESULT(){
  IFS='|' read -r ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILLING_POINT TYPE <<< "$RESULT"
  
  # Trim whitespace for each variable
  ATOMIC_NUMBER=$(echo "$ATOMIC_NUMBER" | xargs)
  ID=$(echo "$ID" | xargs)
  SYMBOL=$(echo "$SYMBOL" | xargs)
  NAME=$(echo "$NAME" | xargs)
  ATOMIC_MASS=$(echo "$ATOMIC_MASS" | xargs)
  MELTING_POINT=$(echo "$MELTING_POINT" | xargs)
  BOILLING_POINT=$(echo "$BOILLING_POINT" | xargs)
  TYPE=$(echo "$TYPE" | xargs)

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILLING_POINT celsius."
}

if [[ -z $INPUT ]]
then
  echo "Please provide an element as an argument."
else
  if [[ "$INPUT" =~ ^[0-9]+$ ]]
  then
    RESULT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE elements.atomic_number=$1;")
    PRINT_RESULT    
  else
    RESULT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE elements.symbol='$1';")
    if [[ -z $RESULT ]]
    then
      RESULT=$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE elements.name='$1';")
      if [[ -z $RESULT ]]
      then
        echo "I could not find that element in the database."
      else
        PRINT_RESULT
      fi    
    else
      PRINT_RESULT
    fi 
  fi
fi