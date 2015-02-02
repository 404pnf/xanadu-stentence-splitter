


# split paragraph to sentences.

Example results:

      Array[5]
      0: "Anonymous is a group of anonymous online activists."
      1: "They are popularly associated with various online and offline protests commonly relating to freedom of speech."
      2: "They often protest against political corruption and censorship.They also use hacking to attack various popular websites such as PayPal and the United States' Department of Justice homepage."
      3: "Other common targets include organizations perceived to be limiting the freedom of speech."
      4: "Anonymous is also often associated with image boards such as 4chan and protests such as the Occupy Movement."
      length: 5
      __proto__: Array[0]

Usage demo:

    $.post('/sentence_text', {data: data})
      .done(function (d) {
        // 返回数组，每个元素是单独的句子。
      });

# split paragraph to sentences.

Example results:

    [Anonymous,is,a,group,of,anonymous,online,activists]

Usage demo:

    $.post('/sentence_token', {data: data})
      .done(function (d) {
        // 返回数组。每个元素是一个数组，其中的元素是该局
      });

# word frequency


Example results:

    {
      "Anonymous": 2,
      "group": 1,
      "anonymous": 1,
      "online": 2
    }

Usage demo:

    $.post('/word_frequency', {data: data})
      .done(function (d) {
        // an json object contains word frequency

      });