function fn() {
    const utils = {};
    utils.readTestData = (file) => {
        var folder = file.substring(0, file.lastIndexOf('/')+1);
        var baseName = file.substring(file.lastIndexOf('/')+1, file.lastIndexOf('.'))
        var extension = file.substring(file.lastIndexOf('.'), file.length);
        var tokens = baseName.split('_');
        // karate.log('folder', folder, 'baseName', baseName, 'extension', extension, 'tokens', tokens)
        var files = [file];
        while (tokens.pop() && tokens.length > 0) {
            files.push(folder + tokens.join('_') + extension);
        }
        files.push(folder + 'baseRequest' + extension);
        files = files.reverse();
        // karate.log('files', files)

        var testData = utils.merge(
            ...files.map(function(file) {
                try {
                    return karate.read(file);
                } catch (e) {
                    return null;
                }
            })
        );

        return testData;
    };
    return utils;
    }