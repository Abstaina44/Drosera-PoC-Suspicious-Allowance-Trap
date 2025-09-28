# Drosera PoC: Suspicious Allowance Trap

This repository demonstrates a **Proof of Concept (PoC) Drosera trap** that detects suspicious ERC20 allowance spikes and triggers an on-chain response. It is designed as an educational project to showcase how decentralized monitoring and automated response systems can enhance security in DeFi ecosystems.

---

## 🚨 Why This Matters

ERC20 token allowances let users approve third parties (like smart contracts) to spend tokens on their behalf. While essential for DeFi, this mechanism is also a common attack vector. Malicious actors exploit it by:

* Tricking users into approving unlimited spend allowances
* Compromising DeFi protocols and draining wallets
* Using phishing or social engineering to hijack approvals
* Leveraging MEV bots to exploit transactions

This project introduces a **Drosera-style trap** to proactively monitor, detect, and respond to these suspicious allowance spikes.

---

## 🔍 What This Trap Does

* **Monitor Token Pairs** – Watches specific owner/spender pairs in real time
* **Detect Spikes** – Identifies when allowances increase beyond a threshold
* **Whitelist Trusted Spenders** – Avoids false positives (DEXes, verified contracts)
* **Trigger Response** – Calls an automated response contract when suspicious activity is detected

When triggered, the response contract logs an **on-chain event** (`SuspiciousAllowanceDetected`) and can be extended to execute custom security actions.

---

## 🛠️ Technologies

| Layer           | Tool / Protocol        |
| --------------- | ---------------------- |
| Security Engine | Drosera                |
| Blockchain      | Ethereum Hoodi Testnet |
| Smart Contracts | Solidity (0.8.20+)     |
| Dev Framework   | Foundry                |
| Testing         | Forge + forge-std      |

---

## 📂 Project Structure

```
drosera-poc/
├── contracts/
│   ├── ITrap.sol                 # Trap interface
│   ├── MockERC20.sol             # Mock ERC20 token for testing
│   ├── ResponseContract.sol      # Emits alerts & handles responses
│   └── SuspiciousAllowanceTrap.sol # Core detection logic
├── script/
│   └── Deploy.s.sol              # Deployment script
├── test/
│   └── SuspiciousAllowanceTrap.t.sol # Unit tests
├── drosera.toml                  # Drosera operator config
├── foundry.toml                  # Foundry project config
├── .env.example                  # Env vars template
└── README.md                     # This file
```

---

## ⚡ Quickstart (macOS/Linux)

### 1. Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc || source ~/.zshrc
foundryup
```

### 2. Clone & Build

```bash
git clone https://github.com/your-username/drosera-poc-suspicious-allowance.git
cd drosera-poc-suspicious-allowance
forge install
forge build
```

### 3. Configure Environment

```bash
cp .env.example .env
# Edit with your RPC_URL_HOODI + PRIVATE_KEY
```

### 4. Run Tests

```bash
forge test -vvv
```

### 5. Deploy to Testnet

```bash
forge script script/Deploy.s.sol \
  --rpc-url $RPC_URL_HOODI \
  --private-key $PRIVATE_KEY \
  --broadcast
```

### 6. Apply Trap with Drosera

```bash
DROSERA_PRIVATE_KEY=$PRIVATE_KEY drosera apply --config drosera.toml
```

---

## ✅ Test Coverage

* No trigger on small allowance increases (< threshold)
* Trigger fires on suspicious spikes (>= threshold)
* Whitelist prevents false positives
* Encodes/decodes allowance data correctly
* Gas & edge cases tested

---

## 🔮 Future Improvements

* Advanced detection logic (statistical patterns, anomaly detection)
* Stronger automated responses (auto-revoke approvals)
* Governance-controlled whitelist
* Operator performance dashboards

---

## ⚠️ Disclaimer

This is a **testnet-only educational demo**. Do **NOT** deploy in production without a security audit. Always verify contract addresses, configs, and permissions before use.

---

## 🙌 Contributions

Pull requests and issues are welcome. Extend detection logic, optimize gas usage, or experiment with response strategies!

---

### 📜 License

MIT

