const functions = require("firebase-functions");
const { Web3 } = require("web3");
require('dotenv').config();

// Conexión a la red Scroll usando Web3
const web3 = new Web3("https://scroll-alpha-rpc.scroll.io/l2");

// Dirección del contrato y ABI
const contractAddress = process.env.CONTRACT_ADDRESS;
const abi = [
	{
		"inputs": [
			{
				"internalType": "string[]",
				"name": "fullName",
				"type": "string[]"
			},
			{
				"internalType": "string[]",
				"name": "CIs",
				"type": "string[]"
			}
		],
		"name": "importPeople",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_nombre",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_sigla",
				"type": "string"
			}
		],
		"name": "registrarCandidato",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "retirarFondos",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "fullName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "CI",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "candidateIndex",
				"type": "uint256"
			}
		],
		"name": "votar",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"stateMutability": "payable",
		"type": "receive"
	},
	{
		"inputs": [],
		"name": "admin",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "candidates",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "candidateHash",
				"type": "bytes32"
			},
			{
				"internalType": "uint256",
				"name": "voteCount",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"name": "hasVoted",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "candidateIndex",
				"type": "uint256"
			}
		],
		"name": "obtenerCandidato",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "candidateHash",
				"type": "bytes32"
			},
			{
				"internalType": "uint256",
				"name": "voteCount",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "obtenerTodosLosCandidatos",
		"outputs": [
			{
				"internalType": "bytes32[]",
				"name": "",
				"type": "bytes32[]"
			},
			{
				"internalType": "uint256[]",
				"name": "",
				"type": "uint256[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"name": "registeredVoters",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "fullName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "CI",
				"type": "string"
			}
		],
		"name": "verificarVotante",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

const contract = new web3.eth.Contract(abi, contractAddress);

// Clave privada del administrador
const privateKey = process.env.PRIVATE_KEY;

// Crear una función para registrar un candidato
exports.registrarCandidato = functions.https.onCall(async (data, context) => {
  try {
    const { nombre, sigla } = data;

    const tx = contract.methods.registrarCandidato(nombre, sigla);
    
    const gas = await tx.estimateGas({ from: web3.eth.accounts.privateKeyToAccount(privateKey).address });
    const gasPrice = await web3.eth.getGasPrice();

    const txData = {
      from: web3.eth.accounts.privateKeyToAccount(privateKey).address,
      to: contractAddress,
      data: tx.encodeABI(),
      gas,
      gasPrice,
    };

    const signedTx = await web3.eth.accounts.signTransaction(txData, privateKey);

    const receipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);
    
    return { success: true, receipt };
  } catch (error) {
    return { success: false, error: error.message };
  }
});

// Crear una función para votar
exports.votar = functions.https.onCall(async (data, context) => {
  try {
    const { voterHash, candidateIndex } = data;

    const tx = contract.methods.votar(voterHash, candidateIndex);
    
    const gas = await tx.estimateGas({ from: web3.eth.accounts.privateKeyToAccount(privateKey).address });
    const gasPrice = await web3.eth.getGasPrice();

    const txData = {
      from: web3.eth.accounts.privateKeyToAccount(privateKey).address,
      to: contractAddress,
      data: tx.encodeABI(),
      gas,
      gasPrice,
    };

    const signedTx = await web3.eth.accounts.signTransaction(txData, privateKey);

    const receipt = await web3.eth.sendSignedTransaction(signedTx.rawTransaction);
    
    return { success: true, receipt };
  } catch (error) {
    return { success: false, error: error.message };
  }
});

// Crear una función para verificar si un votante ha votado
exports.verificarVotante = functions.https.onCall(async (data, context) => {
  try {
    const { voterHash } = data;

    const hasVoted = await contract.methods.verificarVotante(voterHash).call();
    
    return { hasVoted };
  } catch (error) {
    return { success: false, error: error.message };
  }
});

// Crear una función para obtener la información de un candidato
exports.obtenerCandidato = functions.https.onCall(async (data, context) => {
  try {
    const { candidateIndex } = data;

    const candidate = 
        await contract.methods.obtenerCandidato(candidateIndex).call();    
    return {candidate};
  } catch (error) {
    return {success: false, error: error.message};
  }
});
