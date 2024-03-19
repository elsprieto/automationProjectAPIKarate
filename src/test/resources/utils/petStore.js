class PetStore {
    constructor(pets) {
        this.pets = pets;
    }

    countNames = () => {
        let namesCount = {};
        for (let {name} of this.pets) {
            namesCount[name] = (namesCount[name] || 0) + 1;
        }
        return namesCount;

    }
}

