#!/bin/bash

contract=$1
sig=$2

function usage1() {
	local b # bold
	local n # normal
	b=$(tput bold)
	n=$(tput sgr0)
	name=./$(basename $0)

	echo "${b}Usage:${n} $name <CONTRACT> <FUNCTION_SIGNATURE> ...<PARAMS>

  Util to easily call forge contract scripts.

${b}Required args:${n}

  CONTRACT              script name (i.e. XERC20Registry.s.sol)
  FUNCTION_SIGNATURE    function signature (i.e. 'registerPair(address,address,address)')
  PARAMS                function parameters
"
}

function usage2() {
	local b # bold
	local n # normal
	b=$(tput bold)
	n=$(tput sgr0)
	name=./$(basename $0)

	echo "${b}Usage:${n} $name <FUNCTION_SIGNATURE> ...<PARAMS>

  Util to easily call forge contract scripts.

${b}Required args:${n}

  FUNCTION_SIGNATURE    function signature (i.e. 'registerPair(address,address,address)')
  CONTRACT              script name (i.e. XERC20Registry.s.sol)
  PARAMS                function parameters
"
}

if [[ -z "$contract" ]]; then
    echo 'Invalid contract'
    usage1
    exit 1
fi

if [[ -z "$sig" ]]; then
    echo 'Invalid signature'
    usage2
    exit 1
fi

shift 2

dir_name=$(dirname $(realpath $BASH_SOURCE))
contract_path="$dir_name/$contract"

source "$dir_name/../.env"
echo
echo "+ Executing script, config:"
echo "|"
echo "|   ETH_FROM: $ETH_FROM"
echo "|"
echo "|   ENDPOINT: $ENDPOINT"
echo "|"
echo "|   CONTRACT: $contract_path"
echo "+"
echo
forge script \
    --sender "$ETH_FROM" \
    --rpc-url "$ENDPOINT" \
    --sig "$sig" \
    "$contract_path" \
    "$@"
