// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    address public admin;

    struct Candidate {
        bytes32 candidateHash;
        uint voteCount;
    }

    mapping(bytes32 => bool) public hasVoted; // Mapea el hash del votante si ha votado
    Candidate[] public candidates;
    mapping(bytes32 => bool) public registeredVoters; // Mapea el hash de un estudiante registrado

    constructor() {
        admin = msg.sender;
    }

    function registrarCandidato(
        string memory _nombre,
        string memory _sigla
    ) public {
        require(msg.sender == admin, "Solo el administrador puede registrar candidatos.");

        // Crear un hash único para el candidato basado en su información
        bytes32 candidateHash = keccak256(abi.encodePacked(_nombre, _sigla));

        candidates.push(Candidate({
            candidateHash: candidateHash,
            voteCount: 0
        }));
    }

    function importPeople(
        string[] memory fullName,
        string[] memory CIs
    ) public {
        require(msg.sender == admin, "Solo el administrador puede importar votantes.");
        require(fullName.length == CIs.length, "Los arrays deben tener la misma longitud.");

        for (uint i = 0; i < fullName.length; i++) {
            // Crear un hash único para cada estudiante basado en su nombre completo y CI
            bytes32 voterHash = keccak256(abi.encodePacked(fullName[i], CIs[i]));
            registeredVoters[voterHash] = true;
        }
    }

    function votar(
        string memory fullName, 
        string memory CI, 
        uint candidateIndex
    ) public {
        // Generar el voterHash basado en el nombre completo y el CI
        bytes32 voterHash = keccak256(abi.encodePacked(fullName, CI));

        require(registeredVoters[voterHash], "El votante no esta registrado.");
        require(!hasVoted[voterHash], "El votante ya ha votado.");
        require(candidateIndex < candidates.length, "Indice del candidato invalido.");

        // Generar ckey internamente usando el voterHash
        bytes32 ckey = keccak256(abi.encodePacked(voterHash));

        // Validar que el ckey generado coincida con el esperado
        require(ckey == keccak256(abi.encodePacked(voterHash)), "Prueba ckey no valida.");

        // Marcar que el votante ha votado
        hasVoted[voterHash] = true;

        // Incrementar el conteo de votos del candidato
        candidates[candidateIndex].voteCount += 1;
    }

    function obtenerCandidato(uint candidateIndex) public view returns (
        bytes32 candidateHash,
        uint voteCount
    ) {
        require(candidateIndex < candidates.length, "Indice de candidato invalido.");
        Candidate storage candidate = candidates[candidateIndex];
        return (candidate.candidateHash, candidate.voteCount);
    }

    function obtenerTodosLosCandidatos() public view returns (bytes32[] memory, uint[] memory) {
        bytes32[] memory candidateHashes = new bytes32[](candidates.length);
        uint[] memory voteCounts = new uint[](candidates.length);

        for (uint i = 0; i < candidates.length; i++) {
            candidateHashes[i] = candidates[i].candidateHash;
            voteCounts[i] = candidates[i].voteCount;
        }

        return (candidateHashes, voteCounts);
    }

    function verificarVotante(string memory fullName, string memory CI) public view returns (bool) {
        // Generar el voterHash basado en el nombre completo y el CI
        bytes32 voterHash = keccak256(abi.encodePacked(fullName, CI));

        // Verifica si el votante ya ha votado
        return hasVoted[voterHash];
    }

    // Función para que el administrador retire los fondos en caso de ser necesario
    function retirarFondos() public {
        require(msg.sender == admin, "Solo el administrador puede retirar fondos.");
        payable(admin).transfer(address(this).balance);
    }

    // Función para que el contrato reciba Ether en caso de ser necesario
    receive() external payable {}
}
